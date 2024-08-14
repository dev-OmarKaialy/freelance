import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1company/data/customer/profile/ProfileRepo.dart';
import 'package:project1company/data/customer/profile/profileModel.dart';

import '../../../../utils/costants/const.dart';
import '../../controllers-onboarding/profile_controller.dart';

class ProfileShow extends StatefulWidget {
  const ProfileShow({
    Key? key,
    this.id,
  }) : super(key: key);
  final int? id;
  @override
  State<ProfileShow> createState() => _ProfileShowState();
}

class _ProfileShowState extends State<ProfileShow> {
  final ProfileEditController controller = Get.put(ProfileEditController());
  late ProfileModel profile;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    () async {
      final r = await Profilerepo().showProfile(widget.id);
      r.fold((l) {}, (r) {
        profile = r;
      });
      isLoading = false;
      setState(() {});
    }.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: ksecondColor,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                            backgroundImage: controller
                                    .profileImage.value.isEmpty
                                ? const AssetImage(
                                    'assets/images/onboarding-images/ed821872-1b8b-4923-b563-17d74474cc9e.png')
                                : FileImage(File(controller.profileImage.value))
                                    as ImageProvider,
                          );
                        }),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ElevatedButton(
                            onPressed: controller.pickImage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ksecondColor,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FullName: ${profile.data?.name}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kfirstColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          print('Follow button pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ksecondColor,
                        ),
                        child: const Text(
                          'Follow',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Posts:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kfirstColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: profile.data?.posts?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(profile.data?.posts?[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
