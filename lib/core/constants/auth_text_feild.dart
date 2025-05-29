import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';

final authFieldDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 10.0,
  ), // Adjusted vertical padding
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      70,
    ), // Increased border radius for pill shape
    borderSide: BorderSide(color: borderColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(70),
    borderSide: BorderSide(
      color: primaryColor,
    ), // Use primaryColor for focused border
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(70),
    borderSide: BorderSide(color: borderColor),
  ),
  filled: true,
  fillColor: whiteColor,
  hintStyle: style14B.copyWith(
    fontWeight: FontWeight.w400, // Adjusted font weight
    fontSize: 16.sp, // Adjusted font size
    color: hintTextColor,
  ),
);

///
///        forget auth field decoration
///
final InputDecoration forgetAuthFieldDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 15.0,
    horizontal: 10.0,
  ), // Adjusted vertical padding
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      70,
    ), // Increased border radius for pill shape
    borderSide: BorderSide(color: borderColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: primaryColor,
    ), // Use primaryColor for focused border
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: borderColor),
  ),
  filled: true,
  fillColor: whiteColor,
  hintStyle: style14B.copyWith(
    fontWeight: FontWeight.w400, // Adjusted font weight
    fontSize: 16.sp, // Adjusted font size
    color: hintTextColor,
  ),
);
