import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/ui/onboarding_screen/splash_screen.dart';
import 'package:lightweaver/ui/root_screen/root_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  //************ */
  // List<int> prices = [8, 4, 3, 2, 6];
  // prices.add(10);
  // for (int i = 0; i <= prices.length - 1; i++) {
  //   print(prices[i]);
  // }
  //*********** */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          defaultTransition: Transition.rightToLeft,
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
          home: RootScreen(),
        );
      },
    );
  }
}
