import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/ui/home/home_screen.dart';
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

//////////////////////////////
/*
 _topSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(AppAssets().welcomeScreen, scale: 4),
        Positioned(
          top: 180.h,
          left: 10.w,
          child: Text(
            'Welcome, Shayan',
            style: style25B.copyWith(color: primaryColor),
          ),
        ),

        Positioned(
          bottom: 0,
          top: 200,
          right: 15.w, // Added right position
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.h,
                width: 1.sw * 0.6,
                decoration: BoxDecoration(
                  color: transparentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(29),
                    topRight: Radius.circular(29),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Search',
                          suffixIcon: Icon(
                            Icons.search,
                            color: blackColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///
              ///      add new formula
              ///
              Container(
                height: 50,

                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(70.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.add, color: blackColor),
                      Text('New Formula', style: style14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  */

  ///
  ///
  ///
  ///
  ///
  /*
   _secondSection(HomeViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quick Links', style: style18B),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets().bookIcon,
                          color: blackColor,
                          scale: 4,
                        ),
                        20.horizontalSpace,
                        Text('Explore Library', style: style14),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
*/
///
///
///
///
///
///
  ///
  ///
  /*
  Container _CustomQuickLInks(String imageUrl, String title) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Image.asset(imageUrl, color: blackColor, scale: 4),
            20.horizontalSpace,
            Text(title, style: style14),
          ],
        ),
      ),
    );
  }
}
*/