// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/custom_widget/shimmers/my_clients_shimmer.dart';
import 'package:lightweaver/ui/my_client/add_new_client/add_new_client_screen.dart';
import 'package:lightweaver/ui/my_client/my_client_view_model.dart';
import 'package:lightweaver/ui/my_formulas/my_formulas_screen.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class MyClientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyClientViewModel>(
      builder:
          (context, model, child) => ModalProgressHUD(
            inAsyncCall: false,
            child: RefreshIndicator(
              onRefresh: () async {
                await model.getClinets();
              },
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(AppAssets().clientScreen, scale: 4),
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
                            top: 150,
                            left: 10,
                            child: Text(
                              'My Clients',
                              style: style25B.copyWith(color: primaryColor),
                            ),
                          ),

                          Positioned(
                            top: 200,
                            left: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: transparentColor,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Color(0XFFA1A1A1).withOpacity(0.25),
                                    blurRadius: 8.0,
                                    spreadRadius: 0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: TextFormField(
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
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: model.selectedAgeGroup,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: whiteColor,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: primaryColor,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                dropdownColor: primaryColor,
                                items:
                                    model.ageGroups.map((String group) {
                                      return DropdownMenuItem<String>(
                                        value: group,
                                        child: Text(
                                          group,
                                          style: const TextStyle(
                                            color: whiteColor,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                onChanged: (value) {
                                  model.selectedAgeGroup = value!;
                                  model
                                      .notifyListeners(); // ✅ this triggers UI update
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: model.selectedVisit,
                                icon: Icon(Icons.keyboard_arrow_down),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: whiteColor,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                items:
                                    model.visitFilters.map((String filter) {
                                      return DropdownMenuItem<String>(
                                        value: filter,
                                        child: Text(filter),
                                      );
                                    }).toList(),

                                onChanged: (value) {
                                  model.selectedVisit = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      model.state != ViewState.busy
                          ? model.clientData == null
                              ? BuildClientShimmerList()
                              : model.clientData!.isNotEmpty
                              ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                itemCount: model.filteredClientData.length,
                                itemBuilder: (context, index) {
                                  final client =
                                      model.filteredClientData[index];
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: blackColor.withOpacity(0.20),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          client.name ?? "",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Age: ${client.age ?? ""}  |  Gender: ${client.gender ?? ""}',
                                        ),
                                        Text(
                                          'Last Session: ${client.date ?? ""}',
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                elevation: 4,
                                              ),
                                              child: Text(
                                                "View Profile",
                                                style: style14.copyWith(
                                                  color: whiteColor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.to(
                                                  () => MyFormulasScreen(),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                elevation: 4,
                                              ),
                                              child: Text(
                                                "Add Formula",
                                                style: style14.copyWith(
                                                  color: whiteColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                              : Center(
                                child: Text(
                                  "No Clients PLease Add the cleints",
                                ),
                              )
                          : BuildClientShimmerList(),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Get.to(NewClientProfileScreen());
                  },
                  backgroundColor: primaryColor,
                  icon: Icon(Icons.add, color: whiteColor),
                  label: Text(
                    "Add New Client",
                    style: style14B.copyWith(color: whiteColor),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
