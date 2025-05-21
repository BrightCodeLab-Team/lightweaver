// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  Widget? row;
  bool? isWigetEnable;
  IconData? icon;

  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.row,
    this.isWigetEnable,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Center(
            child:
                isWigetEnable == true
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, color: whiteColor),
                        10.horizontalSpace,
                        Text(text, style: style16.copyWith(color: whiteColor)),
                      ],
                    )
                    : Text(text, style: style16.copyWith(color: whiteColor)),
          ),
        ),
      ),
    );
  }
}
