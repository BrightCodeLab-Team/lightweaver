import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/ui/root_screen/root_view_model.dart';

import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  final int? selectedScreen;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RootScreen({super.key, this.selectedScreen = 0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootViewModel(initialIndex: selectedScreen ?? 0),
      child: Consumer<RootViewModel>(
        builder:
            (context, model, child) => Scaffold(
              key: _scaffoldKey,
              backgroundColor: whiteColor,

              ///
              /// Start Body
              ///
              body: model.rootScreens[model.currentIndex],

              ///
              /// BottomBar
              ///
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: whiteColor,
                color: primaryColor,
                maxWidth: double.infinity,
                index: model.currentIndex,
                items: <Widget>[
                  Image.asset(AppAssets().dashbored, scale: 4),
                  Image.asset(AppAssets().myClient, scale: 3),
                  Image.asset(AppAssets().myFormula, scale: 3),
                  Image.asset(AppAssets().notification, scale: 3),
                  Image.asset(AppAssets().setting, scale: 3),
                ],
                onTap: (index) {
                  model.updateIndex(index);
                },
              ),
              // ConvexAppBar(
              //   height: 100,
              //   backgroundColor: whiteColor,
              //   activeColor: primaryColor,
              //   color: lightGreyColor,

              //   style:
              //       TabStyle
              //           .custom, // Change this to fixed so text always appears
              //   initialActiveIndex: model.currentIndex,
              //   // disableDefaultTabController: true,
              //   onTap: (index) {
              //     model.updateIndex(index);
              //   },
              //   items: [
              //     TabItem(
              //       icon: Image.asset(
              //         AppAssets().dashbored,
              //         color:
              //             model.currentIndex == 0 ? whiteColor : lightGreyColor,
              //         scale: 3,
              //       ),
              //       title: 'Dashbored',
              //     ),
              //     TabItem(
              //       icon: Image.asset(
              //         AppAssets().myClient,
              //         color:
              //             model.currentIndex == 1 ? whiteColor : lightGreyColor,
              //         scale: 3,
              //       ),
              //       title: 'My Client',
              //     ),
              //     TabItem(
              //       icon: Image.asset(
              //         AppAssets().myFormula,
              //         color:
              //             model.currentIndex == 2 ? whiteColor : lightGreyColor,
              //         scale: 3,
              //       ),
              //       title: 'My Formula',
              //     ),
              //     TabItem(
              //       icon: Image.asset(
              //         AppAssets().notification,
              //         color:
              //             model.currentIndex == 3 ? whiteColor : lightGreyColor,
              //         scale: 3,
              //       ),
              //       title: 'Notification',
              //     ),
              //     TabItem(
              //       icon: Image.asset(
              //         AppAssets().profile,
              //         color:
              //             model.currentIndex == 4 ? whiteColor : lightGreyColor,
              //         scale: 3,
              //       ),
              //       title: 'Profile',
              //     ),
              //   ],
              // ),

              ///
              /// Right Drawer
              ///
              // endDrawer: buildDrawer(context),
            ),
      ),
    );
  }
}
