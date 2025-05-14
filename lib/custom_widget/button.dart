import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isSelected = true;

  void switchColor() {
    _isSelected = !_isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap;
        switchColor();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          // color: _isSelected ? primaryColor : blackColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15.h,
          ), // Use .h for vertical padding
          child: Center(
            child: Text(
              widget.text,
              style: style16.copyWith(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
