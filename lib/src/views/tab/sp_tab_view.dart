import 'package:flutter/material.dart';
import 'package:flutter_stipop/src/views/tab/sp_search_tap_detail.dart';

class SPTabView extends StatelessWidget {
  final ScrollController scrollController;
  final TabController tabController;

  const SPTabView({
    Key? key,
    required this.scrollController,
    required this.tabController,
    this.showSearch = true,
    // this.showGIFs = true,
    // this.showStickers = true,
  }) : super(key: key);

  final bool showSearch;
  // final bool showStickers;
  // final bool showEmojis;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => TabBarView(
        controller: tabController,
        children: [
          if (showSearch)
            SPSearchTabDetail(
              parentWidth: constraints.biggest.width,
              parentHeight: constraints.biggest.height,
              scrollController: scrollController,
              key: null,
            ),
          // if (showStickers)
          //   GiphyTabDetail(
          //     type: GiphyType.stickers,
          //     scrollController: scrollController,
          //   ),
          // if (showEmojis)
          //   GiphyTabDetail(
          //     type: GiphyType.emoji,
          //     scrollController: scrollController,
          //   )
        ],
      ),
    );
  }
}
