import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1company/core/services/shared_preferences_service.dart';
import 'package:project1company/features/authentications/controllers-onboarding/local-controller.dart';
import 'package:project1company/features/authentications/controllers-onboarding/local.dart';
import 'package:project1company/features/authentications/screens/widgets/homePage.dart';
import 'package:project1company/features/authentications/screens/widgets/login_page.dart';
import 'package:project1company/utils/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentications/controllers-onboarding/settings_controller.dart';
import 'features/authentications/screens/widgets/custom_drawer.dart';

SharedPreferences? sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  Get.put(MyLocaleController(sharedPref!));
  await SharedPreferencesService.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsController(sharedPref!),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Consumer<SettingsController>(
      builder: (context, settingsController, child) {
        return GetMaterialApp(
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          locale: controllerLang.initialLocale,
          translations: MyLocale(),
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkMode,
          themeMode: settingsController.selectedTheme == "Light"
              ? ThemeMode.light
              : ThemeMode.dark,
          home: const LoginPage(),

          /*  PostWidget(
            post: Post(
              id: '1',
              content: 'This is a sample post content'.tr,
              authorName: 'Author Name'.tr,
              authorProfilePicUrl: 'https://example.com/profile.jpg',
              likes: 0,
              comments: [],
            ),
            onDelete: (post) {

            },
            onReport: (post) {
              Get.to(() => ReportPage(post: post));
            },
          ),*/
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      drawer: const CustomDrawer(), // إضافة الـ Drawer هنا
      body: const HomePage(), // شاشة الوظائف كما هي
    );
  }
}
