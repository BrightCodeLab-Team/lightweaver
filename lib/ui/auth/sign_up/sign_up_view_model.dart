import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/model/app_user.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/custom_widget/snack_bar/custom_snack_bar.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/root_screen/root_screen.dart';

class SignUpViewModel extends BaseViewModel {
  AppUser appUser = AppUser();
  final authService = locator<AuthServices>();
  Country? selectedCountry;
  final TextEditingController countryController = TextEditingController();
  final TextEditingController practitionerTypeController =
      TextEditingController();

  ///
  /// password toggle logic
  ///
  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void selectCountry(Country country) {
    selectedCountry = country;
    countryController.text = country.name;
    notifyListeners();
  }

  ///
  ///     practitioner
  ///

  List<String> practitionerTypes = [
    'Psychologist',
    'Therapist',
    'Life Coach',
    'Healer',
    'Other',
  ];

  void selectPractitionerType(String type) {
    practitionerTypeController.text = type;
    notifyListeners();
  }

  resgisterUser() async {
    setState(ViewState.busy);
    final response = await authService.signUpWithEmailPassword(appUser);

    if (response.status == true) {
      customSnackbar(
        title: 'Sucessfull',
        message: 'Your account is register Sucessfully',
      );
      Get.offAll(RootScreen());
    } else {
      customSnackbar(title: 'Error', message: '${response.errorMessage}');
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  ///
  /// Validation logic
  ///

  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );
}
