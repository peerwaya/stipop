import 'package:flutter/widgets.dart';
import 'package:flutter_stipop/src/client/client.dart';
import 'package:flutter_stipop/src/client/models/languages.dart';

class TabProvider with ChangeNotifier {
  String apiKey;
  Color? tabColor;
  Color? textSelectedColor;
  Color? textUnselectedColor;
  String? searchText;
  String lang = SPLanguage.english;
  String userID = "";
  String countryCode = kSpCountry;

  String? _tabType;
  String get tabType => _tabType ?? '';
  set tabType(String tabType) {
    _tabType = tabType;
    notifyListeners();
  }

  TabProvider({
    required this.apiKey,
    required this.userID,
    required this.lang,
    required this.countryCode,
    this.tabColor,
    this.textSelectedColor,
    this.textUnselectedColor,
    this.searchText,
  });

  void setTabColor(Color tabColor) {
    tabColor = tabColor;
    notifyListeners();
  }
}
