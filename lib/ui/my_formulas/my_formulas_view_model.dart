import 'package:flutter/material.dart';
import 'package:lightweaver/core/others/base_view_model.dart';

class MyFormulasViewModel extends BaseViewModel {
  final List<String> remedies = [
    'Rock Rose',
    'Impatiens',
    'Clematis',
    'Star of Bethlehem',
    'Cherry Plum',
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void selectRemedy(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
