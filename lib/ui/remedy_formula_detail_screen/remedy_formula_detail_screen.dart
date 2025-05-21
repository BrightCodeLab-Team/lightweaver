import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/remedy_formula_detail_screen/remedy_forlmua_detail_view_model.dart';

import 'package:provider/provider.dart';

class RemedyFormulaDetailScreen extends StatelessWidget {
  const RemedyFormulaDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RemedyFormulaDetailViewModel(),
      child: Consumer<RemedyFormulaDetailViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(AppAssets().remedy2),
                        Positioned(
                          left: 15,
                          top: 30,
                          child: GestureDetector(
                            onTap: () {
                              print('rout to notification screen');
                              Get.to(NotificationScreen());
                            },
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 15,
                              child: GestureDetector(
                                onTap: () {
                                  navigator!.pop();
                                },
                                child: CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: primaryColor,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 30,
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
                        Positioned(
                          left: 20,
                          top: 200,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(NotificationScreen());
                            },
                            child: Text(
                              'Remedy Details',
                              style: style25B.copyWith(color: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        // REMOVE THE COLUMN HERE
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 10,
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _customTabs(
                                    index: 0,
                                    model: model,
                                    title: 'Bach Flower Remedy',
                                    onTap: () {
                                      model.selectTab(0);
                                    },
                                  ),
                                  _customTabs(
                                    index: 1,
                                    model: model,
                                    title: 'Earth',
                                    onTap: () {
                                      model.selectTab(1);
                                    },
                                  ),
                                  _customTabs(
                                    index: 2,
                                    model: model,
                                    title: 'Panic',
                                    onTap: () {
                                      model.selectTab(2);
                                    },
                                  ),
                                ],
                              ),
                              15.verticalSpace,
                              Row(
                                children: [
                                  _customTabs(
                                    index: 3,
                                    model: model,
                                    title: 'Terror',
                                    onTap: () {
                                      model.selectTab(3);
                                    },
                                  ),
                                  _customTabs(
                                    index: 4,
                                    model: model,
                                    title: 'Fear',
                                    onTap: () {
                                      model.selectTab(4);
                                    },
                                  ),
                                  _customTabs(
                                    index: 5,
                                    model: model,
                                    title: 'Panic',
                                    onTap: () {
                                      model.selectTab(5);
                                    },
                                  ),
                                ],
                              ),
                              model.selectedTabIndex == 0
                                  ? firstTab()
                                  : model.selectedTabIndex == 1
                                  ? SizedBox(
                                    height: 100,
                                    child: Center(child: Text('Earth')),
                                  )
                                  : model.selectedTabIndex == 2
                                  ? SizedBox(
                                    height: 100,
                                    child: Center(child: Text('panic')),
                                  )
                                  : model.selectedTabIndex == 3
                                  ? SizedBox(
                                    height: 100,
                                    child: Center(child: Text('terror')),
                                  )
                                  : model.selectedTabIndex == 4
                                  ? SizedBox(
                                    height: 100,
                                    child: Center(child: Text('fear')),
                                  )
                                  : model.selectedTabIndex == 5
                                  ? SizedBox(
                                    height: 100,
                                    child: Center(child: Text('panic')),
                                  )
                                  : SizedBox(
                                    height: 100,
                                    child: Center(child: Text('no data found')),
                                  ),
                              40.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

///
///  first tab
///
firstTab() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      20.verticalSpacingDiagonal,
      Text('Start Formula', style: style14N.copyWith(color: primaryColor)),
      20.verticalSpace,
      Text(
        textAlign: TextAlign.start,
        'Rock Rose is the remedy for terror and panic. It is the remedy for situations in which the person feels frozen with fear. This is a state of mind in which the person is literally scared stiff and is bordering on being paralyzed with fear.',
        style: style12.copyWith(color: lightGreyColor),
      ),
      20.verticalSpace,
      Text('Properties', style: style14.copyWith(color: blackColor)),
      10.verticalSpace,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: darkBlueColor,
          //     borderRadius: BorderRadius.circular(9999),
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          //     child: Text(
          //       "Grounding",
          //       style: style12.copyWith(color: whiteColor),
          //     ),
          //   ),
          // ),
          _associatedChakras('Grounding', darkBlueColor),
          10.horizontalSpace,
          _associatedChakras('Courage', darkBlueColor),
          10.horizontalSpace,
          _associatedChakras('Calmness', darkBlueColor),
        ],
      ),
      20.verticalSpace,
      Text('Associated Chakras', style: style14.copyWith(color: primaryColor)),
      20.verticalSpace,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _associatedChakras('Root', darkPurpleColor),
          10.horizontalSpace,
          _associatedChakras('Solar Plexus', darkPurpleColor),
        ],
      ),
      20.verticalSpace,

      ///
      ///      related remedies section
      ///
      Text('Related Remedies', style: style14.copyWith(color: primaryColor)),
      20.verticalSpace,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _relatedRemedies(AppAssets().profile, 'Mimulus'),
          10.horizontalSpace,
          _relatedRemedies(AppAssets().profile, 'Cheer'),
        ],
      ),
    ],
  );
}

///
///  associated charks  ///   also for properties section
///
Container _associatedChakras(String title, Color backgroundColor) {
  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(9999),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Text(title, style: style12.copyWith(color: whiteColor)),
    ),
  );
}

///
///   related remedies
///
Container _relatedRemedies(String imageUrl, String title) {
  return Container(
    height: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9999),
      color: whiteColor,
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 2,
          color: blackColor.withOpacity(0.2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: whiteColor,
            radius: 20.r,
            child: Image.asset(imageUrl, scale: 4),
          ),
          20.horizontalSpace,
          Text(title, style: style12),
        ],
      ),
    ),
  );
}

///
///    top tab item
///
Widget _customTabs({
  required int index,
  required RemedyFormulaDetailViewModel model,

  required String title,
  required final VoidCallback onTap,
}) {
  final bool isSelected = model.selectedTabIndex == index;

  return GestureDetector(
    onTap: onTap,

    child: Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 10,
            color: blackColor.withOpacity(0.2),
          ),
        ],
        color: isSelected ? primaryColor : whiteColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Center(
          child: Text(
            title,
            style: style14.copyWith(
              color: isSelected ? whiteColor : blackColor,
            ),
          ),
        ),
      ),
    ),
  );
}
