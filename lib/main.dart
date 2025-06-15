import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/services/notification_services.dart';
import 'package:lightweaver/firebase_option.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/my_client/my_client_view_model.dart';
import 'package:lightweaver/ui/remedy_details/remedy_details_view_model.dart';
import 'package:lightweaver/ui/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // ✅ Initialize Firebase Notifications
  NotificationsService().initConfigure();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: Size(
      //   MediaQuery.of(context).size.width,
      //   MediaQuery.sizeOf(context).height,
      // ),
      designSize: Size(375, 823), // iPhone X size example
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => RemedyDetailsViewModel(),
            ),
            ChangeNotifierProvider(create: (context) => MyClientViewModel()),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.rightToLeft,
            title: 'LightWeaver',
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
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
