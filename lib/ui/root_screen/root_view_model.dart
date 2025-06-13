import 'package:flutter/material.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/ui/home/home_screen.dart';
import 'package:lightweaver/ui/my_client/my_client_screen.dart';
import 'package:lightweaver/ui/my_formulas/myformula_detail/my_formula_details_screen.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/setting/setting_screen.dart';

class RootViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  RootViewModel({int initialIndex = 0}) : _currentIndex = initialIndex;
  void updateIndex(int newIndex) {
    // setState(ViewState.busy);
    _currentIndex = newIndex;
    // setState(ViewState.idle);
    notifyListeners();
  }

  final List<Widget> rootScreens = [
    HomeScreen(),
    MyClientScreen(),
    MyFormulaDetailsScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];
}
