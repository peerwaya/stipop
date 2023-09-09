import 'package:flutter/widgets.dart';

class KeyWordProvider with ChangeNotifier {
  String _keyWordText = "";
  String get keyWordText => _keyWordText;

  int _debounceTimeInMilliseconds = 0;
  int get debounceTimeInMilliseconds => _debounceTimeInMilliseconds;

  set keyWordText(String keyWordText) {
    if (keyWordText == _keyWordText) {
      return;
    }
    _keyWordText = keyWordText;
    notifyListeners();
  }

  KeyWordProvider(String queryText, int debounceTimeInMilliseconds) {
    _keyWordText = queryText;
    _debounceTimeInMilliseconds = debounceTimeInMilliseconds;
  }

  @override
  // ignore: must_call_super
  void dispose() {
    print("Dispose KeyWordProvider");
  }
}
