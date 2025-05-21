import 'package:lightweaver/core/others/base_view_model.dart';

class FormulaHistoryViewModel extends BaseViewModel {
  final List<String> remedies = ['Rock Rose', 'White Chestnut'];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void selectRemedy(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
