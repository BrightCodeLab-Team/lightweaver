import 'package:get/get.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/model/app_user.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/custom_widget/snack_bar/custom_snack_bar.dart';
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
      customSnackbar(
        title: 'Sucessfully',
        message: 'Your account is Login Sucessfully',
      );
    } else {
      customSnackbar(title: 'Error', message: '${result.errorMessage}');
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  userLoginWithGoogle() async {
    setState(ViewState.busy);
    final result = await authAervices.loginWithGoogle();
    if (result.status == true) {
      Get.offAll(() => RootScreen());

      customSnackbar(
        title: 'Sucessfully',
        message: 'Sign In with google Sucessfully',
      );
    } else {
      customSnackbar(title: 'Error', message: '${result.errorMessage}');
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  userFacebookLogin() async {
    setState(ViewState.busy);
    final result = await authAervices.signupWithFacebook();
    if (result.status == true) {
      Get.offAll(() => RootScreen());

      customSnackbar(
        title: 'Sucessfully',
        message: 'Sign In with FaceBook Sucessfully',
      );
    } else {
      customSnackbar(title: 'Error', message: '${result.errorMessage}');
    }
    setState(ViewState.idle);
    notifyListeners();
  }
}
