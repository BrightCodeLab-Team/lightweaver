import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/locator.dart';

class HomeViewModel extends BaseViewModel {
  final authServices = locator<AuthServices>();
  int _selectedQuickLinkIndex = 0;

  int get selectedQuickLinkIndex => _selectedQuickLinkIndex;

  void selectQuickLink(int index) {
    _selectedQuickLinkIndex = index;
    notifyListeners();
  }
}
