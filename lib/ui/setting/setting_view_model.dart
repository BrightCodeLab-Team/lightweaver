
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
  bool isthemeSelect = true;
  int get selectedIndex => _selectedIndex;

  bool emailNotif = true;
  bool pushNotif = true;
  bool smsNotif = false;

  String reminderTime = '15 minutes before';
  String reminderFreq = 'Once only';

  isThemeClick() {
    isthemeSelect = !isthemeSelect;
    notifyListeners();
  }

  final List<String> timeOptions = [
    '5 minutes before',
    '10 minutes before',
    '15 minutes before',
    '30 minutes before',
    '1 hour before',
  ];

  final List<String> freqOptions = ['Once only', 'Daily', 'Weekly'];

  void setEmailNotif(bool value) {
    emailNotif = value;
    notifyListeners();
  }

  void setPushNotif(bool value) {
    pushNotif = value;
    notifyListeners();
  }

  void setSmsNotif(bool value) {
    smsNotif = value;
    notifyListeners();
  }

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


  final List<Map<String, String>> templates = [
    {"title": "Welcome Email", "lastEdited": "2 days ago"},
    {"title": "Password Reset", "lastEdited": "2 days ago"},
    {"title": "Weekly Newsletter", "lastEdited": "2 days ago"},
    {"title": "Order Confirmation", "lastEdited": "2 days ago"},
  ];

  lgout() async {
    setState(ViewState.busy);
    final res = await authServices.logout();
    if (res == true) {
      Get.offAll(SignInScreen());
    }

    setState(ViewState.busy);
  }

}
