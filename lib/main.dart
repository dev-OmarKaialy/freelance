

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project1company/features/authentications/controllers-onboarding/local-controller.dart';
import 'package:project1company/features/authentications/controllers-onboarding/local.dart';
import 'package:project1company/features/authentications/screens/addPost_page.dart';
import 'package:project1company/features/authentications/screens/features_authentications_screens_onboarding/onboarding.dart';
import 'package:project1company/features/authentications/screens/widgets/add_jobs.dart';
import 'package:project1company/features/authentications/screens/widgets/chat_page.dart';
import 'package:project1company/features/authentications/screens/widgets/pinding_post.dart';
import 'package:project1company/utils/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentications/controllers-onboarding/settings_controller.dart';
import 'features/authentications/modules/post.dart';
import 'features/authentications/screens/Settings.dart';
import 'features/authentications/screens/widgets/custom_drawer.dart';
import 'features/authentications/screens/widgets/homePage.dart';


SharedPreferences? sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  Get.put(MyLocaleController(sharedPref!));
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsController(sharedPref!),
      child: MyApp(),

    ),

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Consumer<SettingsController>(
      builder: (context, settingsController, child) {
        return GetMaterialApp(
          locale: controllerLang.initialLocale,
          translations: MyLocale(),
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkMode,
          themeMode: settingsController.selectedTheme == "Light"
              ? ThemeMode.light
              : ThemeMode.dark,


          home: MainScreen(),


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      drawer: CustomDrawer(),  // إضافة الـ Drawer هنا
      body: AddJobScreen(),    // شاشة الوظائف كما هي
    );
  }
}
