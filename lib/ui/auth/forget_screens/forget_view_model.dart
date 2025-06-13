import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/core/services/db_services.dart';
import 'package:lightweaver/custom_widget/snack_bar/custom_snack_bar.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/auth/forget_screens/password_reset_successful.dart';

class ForgetViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  final authServices = locator<AuthServices>();
  final db = locator<DatabaseServices>();

  // sendOtp(BuildContext context) async {
  //   setState(ViewState.busy);

  //   try {
  //     await db.sendOtpToEmail(emailController.text);

  //     setState(ViewState.idle);

  //     customSnackbar(
  //       title: 'Error',
  //       message: 'OTP Send Sucessully on ${emailController.text}',
  //     );
  //     Get.to(() => VerifyCodeScreen(email: emailController.text));
  //   } catch (e) {
  //     setState(ViewState.idle);
  //     customSnackbar(title: 'Error', message: 'Failed to send OTP: $e');
  //   }
  // }

  Future<bool> resetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      customSnackbar(title: 'Error', message: 'Please enter a valid email');
      return false;
    }
    setState(ViewState.busy);
    try {
      await authServices.resetPassword(email);
      Get.to(PasswordResetSuccessfulScreen());

      return true;
    } catch (e) {
      customSnackbar(title: 'Error', message: e.toString());
      return false;
    } finally {
      setState(ViewState.idle);
    }
  }
}
