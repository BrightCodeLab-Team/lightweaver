import 'package:lightweaver/core/others/base_view_model.dart';

class SignInViewModel extends BaseViewModel {
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }
}
