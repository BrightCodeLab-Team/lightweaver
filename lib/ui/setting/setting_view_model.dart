
import 'package:lightweaver/core/others/base_view_model.dart';

class SettingViewModel extends BaseViewModel {

import 'package:get/route_manager.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';

class SettingViewModel extends BaseViewModel {
  final authServices = locator<AuthServices>();

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


  lgout() async {
    setState(ViewState.busy);
    final res = await authServices.logout();
    if (res == true) {
      Get.offAll(SignInScreen());
    }

    setState(ViewState.busy);
  }

}
