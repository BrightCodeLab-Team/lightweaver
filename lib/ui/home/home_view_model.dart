import 'package:lightweaver/core/others/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  int _selectedQuickLinkIndex = 0;

  int get selectedQuickLinkIndex => _selectedQuickLinkIndex;

  void selectQuickLink(int index) {
    _selectedQuickLinkIndex = index;
    notifyListeners();
  }
}
