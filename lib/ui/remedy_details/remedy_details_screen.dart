// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/model/remedies_categories.dart';
import 'package:lightweaver/custom_widget/remedy_details.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/remedy_details/remedy_details_view_model.dart';
import 'package:lightweaver/ui/remedy_details/remedy_formula_detail/remedy_formula_detail_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RemedyDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RemedyDetailsViewModel>(
      builder:
          (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
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
                        Positioned.fill(
                          top: 100.h,
                          left: 10.w,
                          child: Text(
                            'Remedy Details',
                            style: style25B.copyWith(color: primaryColor),
                          ),
                        ),

                        Positioned(
                          // bottom: 0,
                          top: 170,
                          right: 15, // Added right position
                          left: 15,
                          child: TextFormField(
                            onChanged: (value) {
                              model.searchRemediesByName(value);
                            },

                            ///
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
                        ),
                        model.remedyList.isEmpty
                            ? Center(
                              child: Text(
                                "There is no Remedy Details",
                                style: style18B,
                              ),
                            )
                            : Positioned(
                              bottom:
                                  -5, // Adjust this value to appear right under the search bar
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: model.remedyList.length,
                                  itemBuilder: (context, index) {
                                    log(
                                      'This is index $index and the title for the remedy ====> ${model.remedyList[index].categoryName}',
                                    );
                                    return _customTabs(
                                      index: index,
                                      model: model,
                                      title:
                                          model.remedyList[index].categoryName!,
                                      onTap: () {
                                        model.selectQuickLink(index);
                                        model.selectTabFunction(index);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                      ],
                    ),
                    10.verticalSpace,
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            ListView.builder(
                              itemCount: model.filteredRemedies.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final remedy = model.filteredRemedies[index];
                                return CustomRemedyDetailsCardWidget(
                                  remedyCategoryModel: RemedyCategoryModel(
                                    remedies: [remedy],
                                  ), // workaround
                                  isSelected: model.selectedCardIndex == index,
                                  onTap: () {
                                    Get.to(
                                      RemedyFormulaDetailScreen(
                                        remedyDetailsModel: remedy,
                                      ),
                                    );
                                  },
                                  index: index,
                                );
                              },
                            ),

                            50.verticalSpace,
                          ],
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
