import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
// Ensure the correct path
import 'package:image_picker/image_picker.dart';
import '../../../../utils/costants/const.dart';
import '../../controllers-onboarding/profile_admin_controller.dart';

class ProfileShowAdmin extends StatelessWidget {
  final ProfileEditAdminController controller = Get.put(ProfileEditAdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: ksecondColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start (left) of the column
          children: [
            Center(
              child: Stack(
                children: [
                  Obx(() {
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.profileImage.value.isEmpty
                          ? AssetImage('assets/images/onboarding-images/ed821872-1b8b-4923-b563-17d74474cc9e.png')
                          : FileImage(File(controller.profileImage.value)) as ImageProvider,
                    );
                  }),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: ElevatedButton(
                      onPressed: controller.pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ksecondColor,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(8),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Obx(() {
              return Text(
                'FullName: ${controller.fullName.value}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kfirstColor,
                ),
              );
            }),
            SizedBox(height: 16),
            Obx(() {
              return Text(
                'Birth Date: ${controller.birthDate.value}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kfirstColor,
                ),
              );
            }),
            SizedBox(height: 16),
            Obx(() {
              return Text(
                'City: ${controller.city.value}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kfirstColor,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}