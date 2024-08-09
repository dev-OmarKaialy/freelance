
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controllers-onboarding/local-controller.dart';
import '../controllers-onboarding/settings_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(
          child: Text(
            "1".tr,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Consumer<SettingsController>(
            builder: (context, controller, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '3'.tr,
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Radio(
                          value: "en",
                          groupValue: controller.selectedLanguage,
                          onChanged: (value) {
                            if (value != null) {
                              controller.updateLanguage(value);
                              controllerLang.changeLang(value);
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '2'.tr,
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Radio(
                          value: "ar",
                          groupValue: controller.selectedLanguage,
                          onChanged: (value) {
                            if (value != null) {
                              controller.updateLanguage(value);
                              controllerLang.changeLang(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '4'.tr,
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Radio(
                          value: "Light",
                          groupValue: controller.selectedTheme,
                          onChanged: (value) {
                            if (value != null) {
                              controller.updateTheme(value);
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '5'.tr,
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Radio(
                          value: "Dark",
                          groupValue: controller.selectedTheme,
                          onChanged: (value) {
                            if (value != null) {
                              controller.updateTheme(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
