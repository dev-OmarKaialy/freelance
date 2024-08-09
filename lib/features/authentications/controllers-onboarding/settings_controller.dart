
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController with ChangeNotifier {
  final SharedPreferences sharedPref;
  String selectedLanguage;
  String selectedTheme;

  SettingsController(this.sharedPref)
      : selectedLanguage = sharedPref.getString("Lang") ?? "en",
        selectedTheme = sharedPref.getString("Theme") ?? "Light";

  void updateLanguage(String language) {
    selectedLanguage = language;
    sharedPref.setString("Lang", language);
    notifyListeners();
  }

  void updateTheme(String theme) {
    selectedTheme = theme;
    sharedPref.setString("Theme", theme);
    notifyListeners();
  }
}
