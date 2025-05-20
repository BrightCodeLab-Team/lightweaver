import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';
import 'package:lightweaver/ui/home/home_view_model.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(AppAssets().welcomeScreen, scale: 4),
                        Positioned(
                          right: 10,
                          top: 30,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(NotificationScreen());
                            },
                            child: Image.asset(
                              AppAssets().notificationIcon,
                              scale: 4,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 200.h,
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        decoration: authFieldDecoration
                                            .copyWith(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                  ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.add, color: blackColor),
                                      Text('New Formula', style: style14B),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    _secondSection(model),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///
  ///
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
                20.verticalSpace,
                Text('Quick Links', style: style18B),
                20.verticalSpace,
                _CustomQuickLInksItem(
                  onTap: () {
                    // Get.to(SignInScreen());
                  },
                  index: 0,
                  model: model,
                  imageUrl: AppAssets().bookIcon,
                  title: 'Explore Library',
                ),

                20.verticalSpace,
                _CustomQuickLInksItem(
                  onTap: () {
                    // Get.to(SignInScreen());
                  },
                  index: 1,
                  model: model,
                  imageUrl: AppAssets().formulaIcon,
                  title: 'start Library',
                ),

                20.verticalSpace,
                _CustomQuickLInksItem(
                  onTap: () {
                    // Get.to(SignInScreen());
                  },
                  index: 2,
                  model: model,
                  imageUrl: AppAssets().newClient,
                  title: 'Add New Client',
                ),

                20.verticalSpace,
                _CustomQuickLInksItem(
                  onTap: () {
                    // Get.to(SignInScreen());
                  },
                  index: 3,
                  model: model,
                  imageUrl: AppAssets().notificationIcon,
                  title: 'Recent Notification',
                ),

                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
///      custom quick link item
///
Widget _CustomQuickLInksItem({
  required int index,
  required HomeViewModel model,
  required String imageUrl,
  required String title,
  required final VoidCallback onTap,
}) {
  final bool isSelected = model.selectedQuickLinkIndex == index;

  return GestureDetector(
    onTap: () {
      onTap();
      model.selectQuickLink(index);
    },
    child: Container(
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : whiteColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              color: isSelected ? whiteColor : primaryColor,
              scale: 4,
            ),
            20.horizontalSpace,
            Text(
              title,
              style: style14.copyWith(
                color: isSelected ? whiteColor : primaryColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

///
///
///
///    second code
///
///
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lightweaver/core/constants/app_assest.dart';
// import 'package:lightweaver/core/constants/colors.dart';
// import 'package:lightweaver/core/constants/text_style.dart';
// import 'package:lightweaver/ui/home/home_view_model.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => HomeViewModel(),
//       child: Consumer<HomeViewModel>(
//         builder:
//             (context, model, child) => Scaffold(
//               body: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildDashboardHeader(context, model),
//                     // SizedBox(height: -200),
//                     // _buildQuickLinksSection(context, model),
//                   ],
//                 ),
//               ),
//             ),
//       ),
//     );
//   }

//   Widget _buildDashboardHeader(BuildContext context, HomeViewModel model) {
//     // You can now use 'model' to access data or methods from HomeViewModel
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Image.asset(AppAssets().welcomeScreen, scale: 4),
//         Positioned(
//           top: 200.h,
//           left: 10.w,
//           child: Text(
//             'Welcome, Shayan', // You might want to get this from model.userName
//             style: style25B.copyWith(color: primaryColor),
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           top: 200,
//           right: 15.w,
//           left: 15.w,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: 50.h,
//                 width: 1.sw * 0.55,
//                 decoration: BoxDecoration(
//                   color: Colors.transparent, // Use transparentColor if defined
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(29),
//                     topRight: Radius.circular(29),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextFormField(
//                         decoration: InputDecoration(
//                           hintText:
//                               'Search', // You might want to get this from model.searchHint
//                           suffixIcon: Icon(
//                             Icons.search,
//                             color: Colors.black, // Use blackColor if defined
//                             size: 20,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.white, // Use whiteColor if defined
//                   borderRadius: BorderRadius.circular(70.r),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(
//                         Icons.add,
//                         color: Colors.black,
//                       ), // Use blackColor if defined
//                       Text(
//                         'New Formula',
//                         style: style14,
//                       ), // You might want to get this from model.newFormulaText
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildQuickLinksSection(BuildContext context, HomeViewModel model) {
//     // You can now use 'model' to access data or methods from HomeViewModel
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Quick Links',
//             style: style18B,
//           ), // You might want to get this from model.quickLinksTitle
//           SizedBox(height: 10.h),
//           _buildQuickLinkItem(
//             icon: AppAssets().bookIcon,
//             title:
//                 'Explore Library', // You might get this from model.exploreLibraryText
//             backgroundColor: primaryColor,
//             textColor: Colors.black, // Use blackColor if defined
//             iconColor: Colors.black, // Use blackColor if defined
//             onTap: () {
//               // Call a method from your ViewModel here, e.g., model.navigateToLibrary();
//             },
//           ),
//           SizedBox(height: 10.h),
//           _buildQuickLinkItem(
//             icon: Icons.science_outlined,
//             title:
//                 'Start Formula', // You might get this from model.startFormulaText
//             backgroundColor: Colors.white, // Use whiteColor if defined
//             textColor: Colors.black, // Use blackColor if defined
//             iconColor: primaryColor,
//             onTap: () {
//               // Call a method from your ViewModel here, e.g., model.startNewFormula();
//             },
//           ),
//           SizedBox(height: 10.h),
//           _buildQuickLinkItem(
//             icon: Icons.people_alt_outlined,
//             title:
//                 'Add New Client', // You might get this from model.addNewClientText
//             backgroundColor: Colors.white, // Use whiteColor if defined
//             textColor: Colors.black, // Use blackColor if defined
//             iconColor: primaryColor,
//             onTap: () {
//               // Call a method from your ViewModel here, e.g., model.navigateToAddClient();
//             },
//           ),
//           SizedBox(height: 10.h),
//           _buildQuickLinkItem(
//             icon: Icons.notifications_none,
//             title:
//                 'Recent Notifications', // You might get this from model.recentNotificationsText
//             backgroundColor: Colors.white, // Use whiteColor if defined
//             textColor: Colors.black, // Use blackColor if defined
//             iconColor: primaryColor,
//             onTap: () {
//               // Call a method from your ViewModel here, e.g., model.navigateToNotifications();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickLinkItem({
//     required dynamic icon, // Can be IconData or String (for Image.asset)
//     required String title,
//     required Color backgroundColor,
//     required Color textColor,
//     required Color iconColor,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(100),
//           border:
//               backgroundColor == Colors.white
//                   ? Border.all(color: Colors.grey.shade300)
//                   : null,
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//           child: Row(
//             children: [
//               if (icon is String)
//                 Image.asset(icon, color: iconColor, scale: 4)
//               else if (icon is IconData)
//                 Icon(icon, color: iconColor),
//               20.horizontalSpace,
//               Text(title, style: style14.copyWith(color: textColor)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
