import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/colors.dart';

class CustomSocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  const CustomSocialButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: blackColor),
        ),
        child: Center(child: Image.asset(imagePath, scale: 4)),
      ),
    );
  }
}
