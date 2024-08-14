import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project1company/core/extensions/context_extensions.dart';
import 'package:project1company/core/extensions/widget_extensions.dart';
import 'package:project1company/core/services/shared_preferences_service.dart';
import 'package:project1company/features/authentications/controllers-onboarding/login_controller.dart';

import '../../../../utils/costants/const.dart';
import 'custombutton.dart';
import 'customtextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier<bool?> isCompany = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final fullNameController = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    //const Color kPrimaryColor= Color(0xff237AB3);
    // const Color KprimaryyColor= Color(0xff1F5E89);
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.login),
          title: const Text(' Log In  ',
              style: TextStyle(
                fontFamily: ' SedanSC',
                fontWeight: FontWeight.normal,
                fontSize: 35.0,
                color: kfirstColor,
              )),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image(
                image: const AssetImage(
                    'assets/images/onboarding-images/photo_2024-05-10_15-04-33.jpg'),
                width: context.width() * .2,
                height: context.width() * .2,
              ),
            ),
            const SizedBox(
              height: 100,
              width: 100,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                    width: 25,
                  ),
                  const Text(' Create Account As',
                      style: TextStyle(
                        fontFamily: ' SedanSC',
                        fontWeight: FontWeight.normal,
                        fontSize: 50.0,
                        color: kfirstColor,
                      )),
                  ValueListenableBuilder(
                      valueListenable: isCompany,
                      builder: (context, value, _) {
                        return Row(children: [
                          Card.outlined(
                            color: value ?? false ? context.primaryColor : null,
                            child: const SizedBox(
                              width: 150,
                              height: 100,
                              child: Center(
                                child: Text('Company'),
                              ),
                            ),
                          ).onTap(() {
                            isCompany.value = true;
                          }),
                          Card.outlined(
                            color: value ?? true ? null : context.primaryColor,
                            child: const SizedBox(
                              width: 150,
                              height: 100,
                              child: Center(
                                child: Text('Customer'),
                              ),
                            ),
                          ).onTap(() {
                            isCompany.value = false;
                          }),
                        ]);
                      }),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextField(
                        borderColor: kfirstColor,
                        width: 250,
                        hintText: 'Full Name',
                        controller: fullNameController,
                        hintColor: ksecondColor,
                        hintSize: 15,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 25,
                        width: 25,
                      ),
                      CustomTextField(
                        borderColor: kfirstColor,
                        width: 250,
                        hintText: 'Email',
                        hintColor: ksecondColor,
                        hintSize: 15,
                        controller: email,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      CustomTextField(
                        borderColor: kfirstColor,
                        controller: password,
                        width: 250,
                        hintText: 'Password',
                        hintColor: ksecondColor,
                        hintSize: 15,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 25,
                        width: 25,
                      ),
                      CustomOutlinedButton(
                        width: 150,
                        backgroundColor: kfirstColor,
                        borderColor: kfirstColor,
                        text: 'LOGIN',
                        onPressed: () async {
                          if (isCompany.value != null) {
                            await SharedPreferencesService.setRole(
                                isCompany.value!);
                            controller.login({
                              'email': email.text,
                              'password': password.text
                            });
                          }
                        },
                        icon: const Icon(Icons.send),
                        iconColor: kfirstColor,
                        textColor: Colors.black,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
