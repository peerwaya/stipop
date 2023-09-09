library flutter_stipop;

// Imports
import 'package:flutter/material.dart';
import 'package:flutter_stipop/src/client/client.dart';
import 'package:flutter_stipop/src/client/models/languages.dart';
import 'package:flutter_stipop/src/client/models/sp_sticker.dart';
import 'package:flutter_stipop/src/providers/app_bar_provider.dart';
import 'package:flutter_stipop/src/providers/keyword_provider.dart';
import 'package:flutter_stipop/src/providers/sheet_provider.dart';
import 'package:flutter_stipop/src/providers/tab_provider.dart';
import 'package:flutter_stipop/src/views/main_view.dart';
import 'package:provider/provider.dart';

typedef TabTopBuilder = Widget Function(BuildContext context);
typedef TabBottomBuilder = Widget Function(BuildContext context);
typedef SearchAppBarBuilder = Widget Function(
  BuildContext context,
  FocusNode focusNode,
  bool autofocus,
  TextEditingController textEditingController,
  void Function() onClearSearch,
);

class SPGet {
  // Show Bottom Sheet
  static Future<SPSticker?> getSticker({
    required BuildContext context,
    required String apiKey,
    String lang = SPLanguage.english,
    String countryCode = kSpCountry,
    String userID = "",
    String searchText = "",
    String queryText = "",
    bool modal = true,
    Color? tabColor,
    Color? textSelectedColor,
    Color? textUnselectedColor,
    int debounceTimeInMilliseconds = 350,
    TabTopBuilder? tapTopBuilder,
    TabBottomBuilder? tabBottomBuilder,
    SearchAppBarBuilder? searchAppBarBuilder,
  }) {
    if (apiKey == "") {
      throw Exception("apiKey must be not null or not empty");
    }

    return showModalBottomSheet<SPSticker>(
      clipBehavior: Clip.antiAlias,
      shape: Theme.of(context).bottomSheetTheme.shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
          ),
      isScrollControlled: true,
      context: context,
      builder: (ctx) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => AppBarProvider(
              queryText = queryText,
              debounceTimeInMilliseconds,
            ),
          ),
          ChangeNotifierProvider(
            create: (ctx) => KeyWordProvider(
              queryText = "",
              debounceTimeInMilliseconds,
            ),
          ),
          ChangeNotifierProvider(
            create: (ctx) => SheetProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => TabProvider(
              apiKey: apiKey,
              userID: userID,
              tabColor: tabColor ?? Theme.of(context).colorScheme.secondary,
              textSelectedColor: textSelectedColor ??
                  Theme.of(context).textTheme.titleSmall?.color,
              textUnselectedColor: textUnselectedColor ??
                  Theme.of(context).textTheme.bodySmall?.color,
              searchText: searchText,
              countryCode: countryCode,
              lang: lang,
            ),
          )
        ],
        child: SafeArea(
          child: MainView(
            tabTopBuilder: tapTopBuilder,
            tabBottomBuilder: tabBottomBuilder,
            searchAppBarBuilder: searchAppBarBuilder,
          ),
        ),
      ),
    );
  }
}
