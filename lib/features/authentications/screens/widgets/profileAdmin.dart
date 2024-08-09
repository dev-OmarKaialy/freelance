import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:project1company/features/authentications/controllers-onboarding/profile_admin_controller.dart';
import 'package:project1company/features/authentications/screens/widgets/profile_show_admin.dart';
import '../../../../utils/costants/const.dart';

class ProfileEditAdmin extends StatelessWidget {
  final ProfileEditAdminController controller = Get.put(ProfileEditAdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',   style: TextStyle(color: Colors.white)),
        backgroundColor: ksecondColor,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
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

            SizedBox(height: 10),
            TextField(
              onChanged: (value) => controller.fullName.value = value,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(color: kfirstColor),
                prefixIcon: Icon(Icons.person,color: ksecondColor,),
                suffixIcon: Icon(Icons.edit,color: ksecondColor,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => controller.birthDate.value = value,
              decoration: InputDecoration(
                labelText: 'Birth Date',
                labelStyle: TextStyle(color: kfirstColor),
                prefixIcon: Icon(Icons.date_range,color: ksecondColor,),
                suffixIcon: Icon(Icons.edit,color: ksecondColor,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => controller.city.value = value,
              decoration: InputDecoration(
                labelText: 'City',
                labelStyle: TextStyle(color: kfirstColor),
                prefixIcon: Icon(Icons.location_city,color: ksecondColor,),
                suffixIcon: Icon(Icons.edit,color: ksecondColor,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.saveChanges();
                    Get.to((ProfileShowAdmin()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(ksecondColor), // لون خلفية الزر "Save"
                  ),
                  child: Text('save',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0
                  ),),),



                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(ksecondColor), // لون خلفية الزر "Save"
                  ),
                  child: Text('Cancel',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0
                  ),),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}