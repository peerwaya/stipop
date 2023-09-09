import 'package:flutter/widgets.dart';

class AppBarProvider with ChangeNotifier {
  String _queryText = "";
  String get queryText => _queryText;

  int _debounceTimeInMilliseconds = 0;
  int get debounceTimeInMilliseconds => _debounceTimeInMilliseconds;

  set queryText(String queryText) {
    if (_queryText == queryText) {
      return;
    }
    _queryText = queryText;
    notifyListeners();
  }

  AppBarProvider(String queryText, int debounceTimeInMilliseconds) {
    _queryText = queryText;
    _debounceTimeInMilliseconds = debounceTimeInMilliseconds;
  }
}
