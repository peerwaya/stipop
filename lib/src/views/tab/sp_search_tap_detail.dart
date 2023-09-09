import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stipop/src/client/client.dart';
import 'package:flutter_stipop/src/client/models/sp_response.dart';
import 'package:flutter_stipop/src/client/models/sp_sticker.dart';
import 'package:flutter_stipop/src/client/models/sp_trend.dart';
import 'package:flutter_stipop/src/providers/app_bar_provider.dart';
import 'package:flutter_stipop/src/providers/tab_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stipop/src/widgets/shimmer.dart';

class SPSearchTabDetail extends StatefulWidget {
  final ScrollController scrollController;
  final double parentWidth;
  final double parentHeight;
  SPSearchTabDetail(
      {Key? key,
      required this.scrollController,
      required this.parentWidth,
      required this.parentHeight})
      : super(key: key);

  @override
  _SPSearchTabDetailState createState() => _SPSearchTabDetailState();
}

class _SPSearchTabDetailState extends State<SPSearchTabDetail> {
  // Tab Provider
  late TabProvider _tabProvider;

  // AppBar Provider
  late AppBarProvider _appBarProvider;

  // Collection
  SPSearchResponse? _response;

  // List of sickers
  List<SPSticker> _list = [];
  List<SPTrend>? _trendingKeywords;

  // Direction
  final Axis _scrollDirection = Axis.vertical;

  // Axis count
  late int _crossAxisCount;

  // Spacing between gifs in grid
  final double _spacing = 8.0;

  // Default gif with
  late double _gifWidth;

  // Limit of query
  late int _limit;

  // is Loading gifs
  bool _isLoading = false;

  // Offset
  int _pageNumber = 1;

  @override
  void initState() {
    super.initState();

    // Tab Provider
    _tabProvider = Provider.of<TabProvider>(context, listen: false);

    // AppBar Provider
    _appBarProvider = Provider.of<AppBarProvider>(context, listen: false);
    _appBarProvider.addListener(_listenerQuery);
    widget.scrollController.addListener(_scrollListener);
    _gifWidth = 150.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Set items count responsive
    _crossAxisCount = (widget.parentWidth / _gifWidth).round();

    // Set vertical max items count
    // Set vertical max items count
    int mainAxisCount =
        ((MediaQuery.of(context).size.height - 30) / _gifWidth).round();

    _limit = _crossAxisCount * mainAxisCount;

    if (_limit > 100) _limit = 100;
    // Initial _pageNumber
    _pageNumber = 1;

    // Load Initial Data
    _loadMore();
  }

  @override
  void dispose() {
    // dispose listener
    // Important
    widget.scrollController.removeListener(_scrollListener);
    _appBarProvider.removeListener(_listenerQuery);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _list.isEmpty
        ? ShimmerPulse(
            CustomScrollView(
              scrollDirection: _scrollDirection,
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 56.0,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: _spacing),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (c, i) => const DummyAction(),
                        separatorBuilder: (c, i) => const SizedBox(width: 8.0),
                        itemCount: 5),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(_spacing),
                  sliver: SliverGrid.count(
                    crossAxisCount: _crossAxisCount,
                    mainAxisSpacing: _spacing,
                    crossAxisSpacing: _spacing,
                    children: List.generate(30, (index) => const DummyImage()),
                  ),
                )
              ],
            ),
          )
        : CustomScrollView(
            controller: widget.scrollController,
            scrollDirection: _scrollDirection,
            slivers: [
              if (_trendingKeywords != null && _trendingKeywords!.isNotEmpty)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 48.0,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: _spacing),
                        itemBuilder: (c, i) =>
                            _trendingItem(_trendingKeywords![i]),
                        separatorBuilder: (c, i) => const SizedBox(width: 8.0),
                        itemCount: _trendingKeywords!.length),
                  ),
                ),
              SliverPadding(
                padding: EdgeInsets.all(_spacing),
                sliver: SliverGrid.count(
                  crossAxisCount: _crossAxisCount,
                  mainAxisSpacing: _spacing,
                  crossAxisSpacing: _spacing,
                  children: _list.map((e) => _item(e)).toList(),
                ),
              )
            ],
          );
  }

  Widget _trendingItem(SPTrend item) => ActionChip(
        label: Text(item.keyword),
        onPressed: () {
          _appBarProvider.keyWordText = item.keyword;
        },
      );

  Widget _item(SPSticker sticker) {
    double aspectRatio = 1.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () => _selectedSticker(sticker),
        child: ExtendedImage.network(
          sticker.stickerImg,
          cache: true,
          gaplessPlayback: true,
          fit: BoxFit.fill,
          headers: const {'accept': 'image/*'},
          loadStateChanged: (state) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: case2(
              state.extendedImageLoadState,
              {
                LoadState.loading: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Container(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                LoadState.completed: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: ExtendedRawImage(
                    fit: BoxFit.fill,
                    image: state.extendedImageInfo?.image,
                  ),
                ),
                LoadState.failed: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Container(
                    color: Theme.of(context).cardColor,
                  ),
                ),
              },
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _send(SPSticker sticker) async {
    SPClient client =
        SPClient(apiKey: _tabProvider.apiKey, userId: _tabProvider.userID);
    await client.send(sticker,
        query: _appBarProvider.queryText,
        lang: _tabProvider.lang,
        countryCode: _tabProvider.countryCode);
  }

  Future<void> _loadMore() async {
    if (_isLoading || _response?.body.pageMap?.totalCount == _list.length) {
      return;
    }

    _isLoading = true;

    // Giphy Client from library
    SPClient client =
        SPClient(apiKey: _tabProvider.apiKey, userId: _tabProvider.userID);
    List<Future<SPResponse>> responses = [];
    if (_trendingKeywords == null || _trendingKeywords!.isEmpty) {
      responses.add(
        client.trending(
          lang: _tabProvider.lang,
          countryCode: _tabProvider.countryCode,
        ),
      );
    }
    responses.add(
      client.search(
        query: _appBarProvider.queryText,
        lang: _tabProvider.lang,
        pageNumber: _pageNumber,
        countryCode: _tabProvider.countryCode,
        limit: _limit,
      ),
    );
    final results = await Future.wait(responses);
    bool reload = false;
    results.forEach((result) {
      result.mapOrNull(
        trending: (value) {
          reload = value.body.keywordList.isNotEmpty && mounted;
          if (reload) _trendingKeywords = [...value.body.keywordList];
        },
        search: (value) {
          reload = (value.body.stickerList?.isNotEmpty ?? false) && mounted;
          _response = value;
          if (reload) {
            _pageNumber = _pageNumber + 1;
            _list.addAll(value.body.stickerList!);
          }
        },
      );
    });
    if (reload) {
      setState(() {});
    }
    _isLoading = false;
  }

  // Scroll listener. if scroll end load more gifs
  void _scrollListener() {
    if (widget.scrollController.positions.last.extentAfter.lessThan(500) &&
        !_isLoading) {
      _loadMore();
    }
  }

  // Return selected sticker
  void _selectedSticker(SPSticker sticker) {
    _send(sticker);
    Navigator.pop(context, sticker);
  }

  // listener query
  void _listenerQuery() {
    // Reset pagination
    _response = null;

    // Reset list
    _list = [];

    _pageNumber = 1;
    //_trendingKeywords = [];

    // Load data
    _loadMore();
  }

  TValue? case2<TOptionType, TValue>(
    TOptionType selectedOption,
    Map<TOptionType, TValue> branches, [
    TValue? defaultValue,
  ]) {
    if (!branches.containsKey(selectedOption)) {
      return defaultValue;
    }

    return branches[selectedOption];
  }
}

class DummyImage extends StatelessWidget {
  const DummyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.brightness == Brightness.dark
        ? theme.colorScheme.surfaceVariant
        : theme.colorScheme.surfaceVariant;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class DummyAction extends StatelessWidget {
  const DummyAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.brightness == Brightness.dark
        ? theme.colorScheme.surfaceVariant
        : theme.colorScheme.surfaceVariant;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.0),
      ),
      width: 100,
    );
  }
}
