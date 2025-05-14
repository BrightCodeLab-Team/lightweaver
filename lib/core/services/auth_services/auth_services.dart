// class SigInViewModel extends BaseViewModel {
//   String _email = "";
//   String pasword = "";
//   bool isSelected = false;
//   bool get isSelected => _isSelected;
// }
import 'package:lightweaver/core/others/base_view_model.dart';

class SignInViewModel extends BaseViewModel {
  String _email = "";
  String _password = "";
  bool _isSelected = false;

  //final auth = AuthServices();

  bool get isSelected => _isSelected;

  void updateEmail(String newEmail) {
    _email = newEmail;
    _validateForm();
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password = newPassword;
    _validateForm();
    notifyListeners();
  }

  void _validateForm() {
    // Check if both fields are valid
    if (_email.isNotEmpty &&
        _password.isNotEmpty &&
        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_email) &&
        _password.length >= 6) {
      _isSelected = true;
    } else {
      _isSelected =
          false; // if the above condition is not satisfied then return false
    }
  }
}
