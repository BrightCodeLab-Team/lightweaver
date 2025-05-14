import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/ui/auth/forget_screens/forget_screen.dart';
import 'package:lightweaver/ui/auth/forget_screens/set_new_password.dart';
import 'package:lightweaver/ui/auth/forget_screens/verify_code.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';
import 'package:lightweaver/ui/auth/sign_up/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.sizeOf(context).height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: backGroundColor,
              shadowColor: transparentColor,
              surfaceTintColor: transparentColor,
            ),
            scaffoldBackgroundColor: backGroundColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: SetNewPasswordScreen(),
        );
      },
    );
  }
}
