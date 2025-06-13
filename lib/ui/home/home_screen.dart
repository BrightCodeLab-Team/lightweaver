// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/home/home_view_model.dart';
import 'package:lightweaver/ui/my_formulas/myformula_detail/my_formula_details_screen.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/remedy_details/remedy_details_screen.dart';
import 'package:lightweaver/ui/root_screen/root_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(AppAssets().welcomeScreen, scale: 4),
                        Positioned(
                          right: 10,
                          top: 50,

                          child: GestureDetector(
                            onTap: () {
                              Get.to(NotificationScreen());
                            },
                            child: Image.asset(
                              AppAssets().notificationIcon,
                              scale: 4,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 170,
                          left: 16,
                          child: Text(
                            'Welcome, ${model.authServices.appUser.name}',
                            style: style25B.copyWith(color: primaryColor),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          top: 200,
                          right: 15.w, // Added right position
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50.h,
                                width: 1.sw * 0.6,
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(29),
                                    topRight: Radius.circular(29),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: authFieldDecoration
                                              .copyWith(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                    ),
                                                hintText: 'Search',
                                                suffixIcon: Icon(
                                                  Icons.search,
                                                  color: blackColor,
                                                  size: 20,
                                                ),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ///
                              ///      add new formula
                              ///
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => MyFormulaDetailsScreen());
                                },
                                child: Container(
                                  height: 50,

                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(70.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.add, color: blackColor),
                                        Text('New Formula', style: style14B),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    _secondSection(model),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///
  ///
  _secondSection(HomeViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Text('Quick Links', style: style18B),
                20.verticalSpace,
                _CustomQuickLInksItem(
                  onTap: () {
                    Get.to(RemedyDetailsScreen());
                  },
                  index: 0,
                  model: model,
                  imageUrl: AppAssets().bookIcon,
                  title: 'Explore Library',
                ),

                20.verticalSpace,
                _CustomQuickLInksItem(
                  onTap: () {
                    Get.offAll(RootScreen(selectedScreen: 2));
                  },
                  index: 1,
                  model: model,
                  imageUrl: AppAssets().formulaIcon,
                  title: 'Start Library',
                ),

                20.verticalSpace,
                _CustomQuickLInksItem(
                  onTap: () {
                    Get.offAll(RootScreen(selectedScreen: 1));
                  },
                  index: 2,
                  model: model,
                  imageUrl: AppAssets().newClient,
                  title: 'My Client',
                ),

                20.verticalSpace,
                _CustomQuickLInksItem(
                  onTap: () {
                    Get.offAll(RootScreen(selectedScreen: 3));
                  },
                  index: 3,
                  model: model,
                  imageUrl: AppAssets().notificationIcon,
                  title: 'Recent Notification',
                ),

                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
///      custom quick link item
///
Widget _CustomQuickLInksItem({
  required int index,
  required HomeViewModel model,
  required String imageUrl,
  required String title,
  required final VoidCallback onTap,
}) {
  final bool isSelected = model.selectedQuickLinkIndex == index;

  return GestureDetector(
    onTap: () {
      onTap();
      model.selectQuickLink(index);
    },
    child: Container(
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : whiteColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            offset: Offset(5.02, 4.02),
            color: Color(0XFFA1A1A1).withOpacity(0.25),
            blurRadius: 8.04,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              color: isSelected ? whiteColor : primaryColor,
              scale: 4,
            ),
            20.horizontalSpace,
            Text(
              title,
              style: style14.copyWith(
                color: isSelected ? whiteColor : primaryColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
