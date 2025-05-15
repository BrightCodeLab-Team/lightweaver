import 'package:flutter/material.dart';
import 'package:lightweaver/core/others/base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  //      validate email
  TextEditingController emailController = TextEditingController();
  String? validateEmail(String? value) {
    if (value.toString().isEmpty) {
      return 'please enter a valid email';
    } else {
      return null;
    }
  }
}
