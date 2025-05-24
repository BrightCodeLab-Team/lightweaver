// ignore_for_file: use_build_context_synchronously, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/others/connectivity_helper.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/core/services/local_storage_services.dart';
import 'package:lightweaver/custom_widget/dialog/network_dialog.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/onboarding_screen/first_onboarding_screen.dart';
import 'package:lightweaver/ui/root_screen/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthServices>();
  final _localStorateService = locator<LocalStorageServices>();
  // final _notificationService = locator<NotificationsService>();

  _initialSetup() async {
    final connectivityResult = await checkInternetConnectivity();

    ///
    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    ///
    if (connectivityResult == false) {
      Get.dialog(NetworkErrorDialog());
      return;
    }

    ////
    ///initializing notification services
    ///
    // await _notificationService.initConfigure();
    // await _localStorateService.init();
    await _authService.init();
    await Future.delayed(Duration(seconds: 1));
    print('Login State: ${_authService.isLogin}');

    if (_authService.isLogin) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => RootScreen()),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => FirstOnboardingScreen()),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _initialSetup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset(AppAssets().splashImage, scale: 4)),
        ],
      ),
    );
  }
}
