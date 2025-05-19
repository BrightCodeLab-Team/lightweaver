import 'package:flutter/material.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/ui/root_screen/root_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RootViewModel(),
      child: Consumer<RootViewModel>(
        builder: (context, model, _) {
          return Scaffold(
            body: model.rootScreens[model.currentIndex],
            bottomNavigationBar: StylishBottomBar(
              option: AnimatedBarOptions(
                iconStyle: IconStyle.animated,
                iconSize: 30,
              ),
              items: [
                BottomBarItem(
                  icon: const Icon(
                    Icons.people_alt_outlined,
                    color: blackColor,
                  ),
                  title: const Text(
                    'My Clients',
                    style: TextStyle(color: blackColor, fontSize: 8),
                  ),
                  backgroundColor: Colors.amber,
                  //selectedColor: blackColor,
                  unSelectedColor: blackColor,
                ),
                BottomBarItem(
                  icon: const Icon(Icons.science_outlined, color: blackColor),
                  title: const Text(
                    'My Formulas',
                    style: TextStyle(color: blackColor, fontSize: 8),
                  ),
                  backgroundColor: Colors.amber,
                  // selectedColor: blackColor,
                  unSelectedColor: blackColor,
                ),
                BottomBarItem(
                  icon: const Icon(Icons.notifications_none, color: blackColor),
                  selectedColor: blackColor,
                  title: const Text(
                    'Notifications',
                    style: TextStyle(color: blackColor, fontSize: 8),
                  ),
                  backgroundColor: Colors.amber,
                ),
                BottomBarItem(
                  icon: const Icon(Icons.person_outline, color: blackColor),
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: blackColor, fontSize: 8),
                  ),
                  backgroundColor: Colors.amber,
                  selectedColor: blackColor,
                  unSelectedColor: blackColor,
                ),
              ],
              currentIndex: model.currentIndex,
              onTap: (index) {
                model.updateIndex(index);
              },
              //fabLocation: StylishBarFabLocation.end,
              backgroundColor: Colors.amber,

              hasNotch: true,
            ),
          );
        },
      ),
    );
  }
}
