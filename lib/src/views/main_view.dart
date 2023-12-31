import 'package:flutter/material.dart';
import 'package:flutter_stipop/flutter_stipop.dart';
import 'package:flutter_stipop/src/providers/sheet_provider.dart';
import 'package:flutter_stipop/src/views/appbar/searchappbar.dart';
import 'package:flutter_stipop/src/views/tab/sp_tab_top.dart';
import 'package:flutter_stipop/src/views/tab/sp_tab_view.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({
    Key? key,
    this.showSearch = true,
    // this.showGIFs = true,
    // this.showStickers = true,
    this.tabTopBuilder,
    this.tabBottomBuilder,
    this.searchAppBarBuilder,
  }) : super(key: key);

  final bool showSearch;
  // final bool showStickers;
  // final bool showEmojis;
  final TabTopBuilder? tabTopBuilder;
  final TabBottomBuilder? tabBottomBuilder;
  final SearchAppBarBuilder? searchAppBarBuilder;

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  // Scroll Controller
  late ScrollController _scrollController;

  // Sheet Provider
  late SheetProvider _sheetProvider;

  // Tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: [
        widget.showSearch,
        // widget.showEmojis,
        // widget.showStickers,
      ].where((isShown) => isShown).length,
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    _sheetProvider = Provider.of<SheetProvider>(context, listen: false);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _draggableScrollableSheet();
  }

  Widget _draggableScrollableSheet() => DraggableScrollableSheet(
      expand: _sheetProvider.isExpanded,
      minChildSize: SheetProvider.minExtent,
      maxChildSize: SheetProvider.maxExtent,
      initialChildSize: _sheetProvider.initialExtent,
      builder: (ctx, scrollController) {
        // Set ScrollController

        _scrollController = scrollController;
        return _bottomSheetBody();
      });

  Widget _bottomSheetBody() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.tabTopBuilder?.call(context) ?? SPTabTop(),
          // SPTabBar(
          //   tabController: _tabController,
          //   showGIFs: widget.showGIFs,
          //   showStickers: widget.showStickers,
          //   showEmojis: widget.showEmojis,
          // ),
          SearchAppBar(
            scrollController: _scrollController,
            searchAppBarBuilder: widget.searchAppBarBuilder,
          ),
          Expanded(
            child: SPTabView(
              tabController: _tabController,
              scrollController: _scrollController,
              showSearch: widget.showSearch,
              // showStickers: widget.showStickers,
              // showEmojis: widget.showEmojis,
            ),
          ),
          widget.tabBottomBuilder?.call(context) ?? const SizedBox.shrink(),
        ],
      );
}
