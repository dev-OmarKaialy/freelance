import 'package:flutter/material.dart';
import 'package:project1company/features/authentications/controllers-onboarding/onboarding-controller.dart';

import '../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        child: TextButton(
          onPressed:()=> OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}