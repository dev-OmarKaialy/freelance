import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/costants/const.dart';
import 'custombutton.dart';
import 'customtextfield.dart';



class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(LoginController());
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
            const Padding(
              padding: EdgeInsets.all(50),
              child: Image(
                image: AssetImage(
                    'assets/images/onboarding-images/photo_2024-05-10_15-04-33.jpg'),
                width: 700,
                height: 700,
              ),
            ),
            const SizedBox(
              height: 100,
              width: 100,
            ),
            Column(
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
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextField(
                      borderColor: kfirstColor,
                      width: 150,
                      hintText: 'Full Name',
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
                      width: 150,
                      hintText: 'Email',
                      hintColor: ksecondColor,
                      hintSize: 15,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    CustomTextField(
                      borderColor: kfirstColor,
                      width: 150,
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
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      iconColor: kfirstColor,
                      textColor: Colors.white,
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
