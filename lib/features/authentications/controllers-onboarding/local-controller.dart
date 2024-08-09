
import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocaleController extends GetxController {
  final SharedPreferences sharedPref;

  MyLocaleController(this.sharedPref);

  Locale get initialLocale {
    String? langCode = sharedPref.getString("Lang");
    if (langCode == null) {
      return Locale('en');
    }
    return Locale(langCode);
  }

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    sharedPref.setString("Lang", codeLang);
    Get.updateLocale(locale);
  }
}
