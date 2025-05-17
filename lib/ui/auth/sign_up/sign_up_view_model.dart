import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:lightweaver/core/others/base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  ///
  /// password toggle logic
  ///
  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  ///
  /// Country picker
  ///
  String? selectedGender;
  Country? selectedCountry;
  String? selectedCity;
  List<String> selectedCities = [];

  final TextEditingController countryController = TextEditingController();

  void selectCountry(Country country) {
    selectedCountry = country;
    countryController.text = country.name;
    notifyListeners();
  }

  ///
  ///     practitioner
  ///
  final TextEditingController practitionerTypeController =
      TextEditingController();

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

  ///
  /// Validation logic
  ///

  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );
}
