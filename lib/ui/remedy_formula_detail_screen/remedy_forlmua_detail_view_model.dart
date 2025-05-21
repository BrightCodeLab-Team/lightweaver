import 'package:lightweaver/core/others/base_view_model.dart';

class RemedyFormulaDetailViewModel extends BaseViewModel {
  int selectedTabIndex = 0;

  void selectTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }
}
