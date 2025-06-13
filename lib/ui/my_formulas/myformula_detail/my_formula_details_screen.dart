// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/strings.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/custom_widget/shimmers/my_clients_shimmer.dart';
import 'package:lightweaver/ui/my_formulas/formula_history/formula_history_screen.dart';
import 'package:lightweaver/ui/my_formulas/my_formulas_screen.dart';
import 'package:lightweaver/ui/my_formulas/myformula_detail/myformula_details_view_model.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class MyFormulaDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MyFormulaDetailsViewModel(),
      child: Consumer<MyFormulaDetailsViewModel>(
        builder:
            (context, model, child) => ModalProgressHUD(
              inAsyncCall: false,
              child: RefreshIndicator(
                onRefresh: () async {
                  await model.getAllFormulas();
                },
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(AppAssets().remedyDetailsScreen),
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
                            Positioned.fill(
                              top: 100.h,
                              left: 10.w,
                              child: Text(
                                'Remedy Details',
                                style: style25B.copyWith(color: primaryColor),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        model.searchFormulasByName(
                                          value,
                                        ); // Enable search
                                      },
                                      decoration: authFieldDecoration.copyWith(
                                        contentPadding: EdgeInsets.symmetric(
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
                                  ),
                                  10.horizontalSpace,

                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => MyFormulasScreen());
                                      },
                                      child: Container(
                                        height: 50,

                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            70.r,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.add, color: blackColor),
                                            Text(
                                              'New Formula',
                                              style: style14B,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        model.state == ViewState.busy
                            ? Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: BuildClientShimmerList(),
                            )
                            : model.formulas.isEmpty && model.formulas == null
                            ? Center(
                              child: Text(
                                "There is no Formula Please Add New Formula.Thanks",
                                style: style16,
                              ),
                            )
                            : ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.formulas.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 15,
                                          offset: Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${model.formulas[index].formulaName}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color(
                                                  0xFFF4B400,
                                                ), // Amber yellow
                                              ),
                                            ),
                                            Spacer(),
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                Get.to(
                                                  () => FormulaHistoryScreen(
                                                    formulaData: model.formulas,
                                                    index: index,
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.remove_red_eye,
                                                color: Color(0xFFF4B400),
                                              ),
                                              label: Text(
                                                "View",
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.grey[100],
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                elevation: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Text(
                                              "${model.formulas[index].clientName}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Icon(
                                              Icons.circle,
                                              size: 8,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              formatDate(
                                                model.formulas[index].createdAt,
                                              ),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "${model.formulas[index].remedies!.length ?? 0}  Remedies",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "Sent:",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "Yes",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
