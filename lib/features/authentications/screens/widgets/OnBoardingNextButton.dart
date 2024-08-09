import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project1company/features/authentications/controllers-onboarding/onboarding-controller.dart';

import '../../../../utils/costants/colors.dart';
import '../../../../utils/helper/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(child: ElevatedButton(
      onPressed: ()=> OnBoardingController.instance.nextPage(),
      style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? TColors.primary:Colors.black),
      child: const Icon(Iconsax.arrow_right_3),
    ));
  }
}