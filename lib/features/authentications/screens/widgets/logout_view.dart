// logout_page.dart

// logout_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers-onboarding/authlogout_controller.dart';



class LogoutPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'Logout Confirmation',
              content:  const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child:  const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _authController.logout();
                    Get.back();
                    // Navigate to login page or home page
                    Get.toNamed('/login');
                  },
                  child: const  Text('Logout'),
                ),
              ],
            );
          },
          child: const  Text('Logout'),
        ),
      ),
    );
  }
}