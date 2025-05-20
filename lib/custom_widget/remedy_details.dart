import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/model/remedy_details.dart';

class CustomRemedyDetailsCardWidget extends StatelessWidget {
  final RemedyModel remedy;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRemedyDetailsCardWidget({
    super.key,
    required this.remedy,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          color: isSelected ? primaryColor : whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  remedy.imageUrl ?? AppAssets().profile,
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    Text(
                      '${remedy.title}',
                      style: style16B.copyWith(
                        color: isSelected ? whiteColor : primaryColor,
                      ),
                    ),
                    15.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'for: ',
                          style: style12.copyWith(
                            color: isSelected ? whiteColor : darkGreyColor,
                          ),
                        ),
                        ...remedy.uses.map(
                          (use) => Text(
                            " $use,",
                            style: style14.copyWith(
                              color: isSelected ? whiteColor : darkGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Key words:',
                          style: style12.copyWith(
                            fontWeight: FontWeight.w500,
                            color: isSelected ? whiteColor : lightGreyColor2,
                          ),
                        ),
                        ...remedy.keywords.map(
                          (keywords) => Text(
                            " $keywords,",
                            style: style14.copyWith(
                              color: isSelected ? whiteColor : lightGreyColor2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        print('rout to detail screen');
                      },
                      child: Text(
                        'View details',
                        style: style16.copyWith(
                          color: isSelected ? whiteColor : primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
