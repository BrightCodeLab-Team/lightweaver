import 'package:lightweaver/core/others/base_view_model.dart';

class SettingViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
