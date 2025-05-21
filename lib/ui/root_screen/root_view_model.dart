import 'package:flutter/material.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/ui/home/home_screen.dart';
import 'package:lightweaver/ui/my_client/my_client_screen.dart';
import 'package:lightweaver/ui/my_formulas/my_formulas_screen.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/setting/setting_screen.dart';

class RootViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  RootViewModel({int initialIndex = 0}) : _currentIndex = initialIndex;
  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  final List<Widget> rootScreens = [
    const HomeScreen(),
    const MyClientScreen(),
    const MyFormulasScreen(),
    const NotificationScreen(),
    SettingScreen(),
  ];
}
