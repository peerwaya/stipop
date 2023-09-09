import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_stipop/flutter_stipop.dart';
import 'package:flutter_stipop/src/providers/app_bar_provider.dart';
import 'package:flutter_stipop/src/providers/sheet_provider.dart';
import 'package:flutter_stipop/src/tools/debouncer.dart';
import 'package:provider/provider.dart';

class SearchAppBar extends StatefulWidget {
  // Scroll Controller
  final ScrollController scrollController;
  final SearchAppBarBuilder? searchAppBarBuilder;

  SearchAppBar({
    Key? key,
    required this.scrollController,
    this.searchAppBarBuilder,
  }) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  // Tab Provider

  // AppBar Provider
  late AppBarProvider _appBarProvider;

  // Sheet Provider
  late SheetProvider _sheetProvider;

  // Input controller
  late TextEditingController _textEditingController;

  // Input Focus
  final FocusNode _focus = FocusNode();

  String? _keyWordText;

  @override
  void initState() {
    // Focus
    _focus.addListener(_focusListener);

    //Set Texfield Controller
    _textEditingController = TextEditingController(
        text: Provider.of<AppBarProvider>(context, listen: false).queryText);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Establish the debouncer
      final debouncer = Debouncer(
        delay: Duration(
          milliseconds: _appBarProvider.debounceTimeInMilliseconds,
        ),
      );

      // Listener TextField
      _textEditingController.addListener(() {
        debouncer.call(() {
          if (_appBarProvider.queryText != _textEditingController.text) {
            _appBarProvider.queryText = _textEditingController.text;
          }
        });
      });

      _appBarProvider.addListener(() {
        debouncer.call(() {
          if (_appBarProvider.keyWordText != _keyWordText) {
            _keyWordText = _appBarProvider.keyWordText;
            _textEditingController.value = TextEditingValue(
              text: _keyWordText!,
              selection: TextSelection.collapsed(offset: _keyWordText!.length),
            );
          }
        });
      });
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Providers

    _sheetProvider = Provider.of<SheetProvider>(context);

    // AppBar Provider
    _appBarProvider = Provider.of<AppBarProvider>(context);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: _searchWidget(),
    );
  }

  Widget _searchWidget() {
    return widget.searchAppBarBuilder?.call(
          context,
          _focus,
          _sheetProvider.initialExtent == SheetProvider.maxExtent,
          _textEditingController,
          () {
            setState(() {
              _textEditingController.clear();
            });
          },
        ) ??
        SizedBox(
          height: 40,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                autofocus:
                    _sheetProvider.initialExtent == SheetProvider.maxExtent,
                focusNode: _focus,
                controller: _textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  prefixIcon: _searchIcon(),
                  hintText: MaterialLocalizations.of(context).searchFieldLabel,
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                      onPressed: () {
                        if (_textEditingController.text.isEmpty) {
                          Navigator.of(context).pop();
                          return;
                        }
                        setState(() {
                          _textEditingController.clear();
                        });
                      }),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                autocorrect: false,
              ),
            ),
          ),
        );
  }

  Widget _searchIcon() {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFFFF6666),
          Color(0xFF9933FF),
        ],
      ).createShader(bounds),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }

  void _focusListener() {
    // Set to max extent height if Textfield has focus
    if (_focus.hasFocus &&
        _sheetProvider.initialExtent == SheetProvider.minExtent) {
      _sheetProvider.initialExtent = SheetProvider.maxExtent;
    }
  }
}
