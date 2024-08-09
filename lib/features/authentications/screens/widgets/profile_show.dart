import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../../utils/costants/const.dart';
import '../../controllers-onboarding/profile_controller.dart';


class ProfileShow extends StatelessWidget {
  final ProfileEditController controller = Get.put(ProfileEditController());

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Obx(() {
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.profileImage.value.isEmpty
                          ? AssetImage('assets/images/onboarding-images/ed821872-1b8b-4923-b563-17d74474cc9e.png')
                          : FileImage(File(controller.profileImage.value))as ImageProvider,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FullName: ${controller.fullName.value}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kfirstColor,
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {

                    print('Follow button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ksecondColor,
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),


            SizedBox(height: 16), Align( alignment: Alignment.centerLeft,
              child: Text( 'Posts:', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,
                color: kfirstColor, ), ), ),
            Expanded(


              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(controller.posts[index]),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}