import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';
import 'package:lightweaver/ui/onboarding_screen/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.sh * 0.7,
                      child: PageView.builder(
                        controller: model.pageController,
                        itemCount: model.items.length,
                        onPageChanged: model.onPageChanged,
                        itemBuilder: (context, index) {
                          final item = model.items[index];
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(item.imageUrl, scale: 4),
                                  Positioned(
                                    bottom: -0,
                                    right: 120,
                                    child: CircleAvatar(
                                      radius: 60.r,
                                      backgroundColor: darkGreyColor,
                                      // backgroundImage: AssetImage(
                                      //   model.currentPage == 0
                                      //       ? AppAssets().stack1
                                      //       : AppAssets().stack2,
                                      // ),
                                      backgroundImage: AssetImage(
                                        model.imagesList[index],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    right: 6,
                                    child: TextButton(
                                      onPressed: model.skip,
                                      child: Text(
                                        'Skip',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              30.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: style20B.copyWith(color: primaryColor),
                                ),
                              ),
                              10.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0,
                                ),
                                child: Text(
                                  item.subtitle,
                                  textAlign: TextAlign.center,
                                  style: style14.copyWith(color: darkGreyColor),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    ///
                    ///     page indicator
                    ///
                    SmoothPageIndicator(
                      controller: model.pageController,
                      count: model.items.length,
                      effect: WormEffect(
                        dotColor: primaryColor.withOpacity(0.3),
                        activeDotColor: primaryColor,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 5,
                      ),
                    ),
                    50.verticalSpace,

                    ///
                    ///     last button
                    ///
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment:
                            model.currentPage == model.items.length - 1
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.end,
                        children: [
                          if (model.currentPage > 0 &&
                              model.currentPage != model.items.length - 1)
                            TextButton(
                              onPressed: model.previousPage,
                              child: Text(
                                'Back',
                                style: style16.copyWith(color: blackColor),
                              ),
                            ),
                          if (model.currentPage != model.items.length - 1)
                            const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              model.currentPage == model.items.length - 1
                                  ? Get.to(SignInScreen())
                                  : model.nextPage();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: whiteColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Text(
                                model.currentPage == model.items.length - 1
                                    ? 'Get Started'
                                    : 'Next',
                                style: style16.copyWith(color: whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Image.asset(AppAssets().onboardCornor, scale: 4),
                    // ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

///
///      onboarding model
///
class OnboardingItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String stackImageUrl;

  OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.stackImageUrl,
  });
}
