import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/remedy_details.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/remedy_details/remedy_details_view_model.dart';
import 'package:provider/provider.dart';

class RemedyDetailsScreen extends StatelessWidget {
  const RemedyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RemedyDetailsViewModel(),
      child: Consumer<RemedyDetailsViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(AppAssets().remedyDetailsScreen),
                        Positioned(
                          right: 10,
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



                          bottom: 0,
                          top: 80,
                          right: 15.w, // Added right position
                          child: Row(
                            children: [
                              Container(
                                height: 50.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(29),
                                    topRight: Radius.circular(29),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      decoration: authFieldDecoration.copyWith(
                                        contentPadding: EdgeInsets.symmetric(
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
                                  ],
                                ),
                              ),

                              ///
                              ///      add new formula
                              ///
                            ],

                          ),
                        ),
                        Positioned(
                          bottom:
                              -5, // Adjust this value to appear right under the search bar
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: model.quickLinkTitles.length,
                              itemBuilder: (context, index) {
                                return _customTabs(
                                  index: index,
                                  model: model,
                                  title: model.quickLinkTitles[index],
                                  onTap: () {
                                    model.selectQuickLink(index);
                                    model.selectTabFunction(index);
                                  },
                                );
                              },
                            ),
                          ),

                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                          //   child: Row(
                          //     children: List.generate(
                          //       model.quickLinkTitles.length,
                          //       (index) => Padding(
                          //         padding: EdgeInsets.only(right: 10.w),
                          //         child: ,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
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
  _secondSection(RemedyDetailsViewModel model) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            model.selectedTabIndex == 0
                ? ListView.builder(
                  itemCount: model.remedyList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Important!
                  itemBuilder: (BuildContext context, int index) {
                    return CustomRemedyDetailsCardWidget(
                      remedy: model.remedyList[index],
                      isSelected: model.selectedCardIndex == index,
                      onTap: () => model.selectCard(index),
                    );
                  },
                )
                : model.selectedTabIndex == 1
                ? Text('category')
                : model.selectedTabIndex == 2
                ? Text('property')
                : model.selectedTabIndex == 3
                ? Text('vibration')
                : model.selectedTabIndex == 4
                ? Text('use')
                : Text('all'),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}

///
///      custom quick link item
///
Widget _customTabs({
  required int index,
  required RemedyDetailsViewModel model,

  required String title,
  required final VoidCallback onTap,
}) {
  final bool isSelected = model.selectedQuickLinkIndex == index;

  return GestureDetector(
    onTap: onTap,

    child: Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : whiteColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
