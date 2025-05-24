import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/model/app_user.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/root_screen/root_screen.dart';

class SignInViewModel extends BaseViewModel {
  AppUser appUser = AppUser();
  final authAervices = locator<AuthServices>();
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  userLogin() async {
    setState(ViewState.busy);
    final result = await authAervices.loginWithEmailPassword(appUser);

    if (result != null && result.status == true) {
      Get.offAll(() => RootScreen());
      Get.snackbar('Sucessfully', 'Your account is Login Sucessfully');
    } else {
      Get.snackbar('Error', '${result.errorMessage}');
    }
    setState(ViewState.idle);
    notifyListeners();
  }
}
