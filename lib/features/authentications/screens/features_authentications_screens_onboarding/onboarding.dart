import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project1company/features/authentications/controllers-onboarding/onboarding-controller.dart';
import 'package:project1company/utils/costants/images_srtings.dart';
import 'package:project1company/utils/costants/sizes.dart';
import 'package:project1company/utils/costants/text_strings.dart';
import 'package:project1company/utils/device/device_utility.dart';
import 'package:project1company/utils/helper/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/costants/colors.dart';
import '../widgets/OnBoardingNextButton.dart';
import '../widgets/onboarding_dot_navigation.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());


     THelperFunctions;
    return  Scaffold(
      body : Stack(
        children:[
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: TImages.onboardingImage1,
              title: TText.onboardingTitle1,
                subTitle: TText.onboardingSubTitle1,

              ),
              OnBoardingPage(image: TImages.onboardingImage2,
                title: TText.onboardingTitle2,
                subTitle: TText.onboardingSubTitle2,

              ),
              OnBoardingPage(image: TImages.onboardingImage3,
                title: TText.onboardingTitle3,
                subTitle: TText.onboardingSubTitle3,

              ),
            ],
          ),
          ///SKIP BUTTON 
          const OnBoardingSkip(),

          ///Dot Navigation
         const OnBoardingDotNavigation(),
          
         const OnBoardingNextButton(),
        ],
      ),
    );
  }
}







/*class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });
  final String image,title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: THelperFunctions.screenWidth(context) * 0.8,
              height: THelperFunctions.screenHeight(context )* 0.6,
              image: AssetImage(image)),
          Text(title,
          style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtItems,),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}*/
