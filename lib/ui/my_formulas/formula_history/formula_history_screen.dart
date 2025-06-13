// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/strings.dart';
import 'package:lightweaver/core/model/formula_model.dart';
import 'package:lightweaver/custom_widget/custom_backround_stack.dart';
import 'package:lightweaver/ui/my_formulas/formula_history/formula_history_view_model.dart';
import 'package:provider/provider.dart';

class FormulaHistoryScreen extends StatelessWidget {
  List<FormulaModel>? formulaData;
  int index;
  FormulaHistoryScreen({required this.formulaData, required this.index});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormulaHistoryViewModel(),
      child: Consumer<FormulaHistoryViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomBackgroundStack(
                    backgroundImage: AppAssets().formulaHistoryScreen,
                    title: "Formula History",
                    isFieldEnabled: true,
                    showSearchField: true,
                    hintText: "Search formulas...",
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      //height: 450,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: Offset(4, 6),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),

                      ///
                      ///Column First Section
                      ///
                      ///
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              height: 130,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    offset: Offset(4, 6),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${formulaData![index].formulaName}" ??
                                            "",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          color: Colors.grey[200],
                                        ),
                                        child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.visibility,
                                              color: primaryColor,
                                              size: 18,
                                            ),
                                            2.horizontalSpace,
                                            Text("View"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    "For ${formulaData![index].clientName ?? ""} •",
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        formatDate(
                                          formulaData![index].createdAt,
                                        ),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      Text(
                                        "${formulaData![index].remedies!.length ?? 0} Remedies",
                                      ),
                                      Row(
                                        children: [
                                          Text("Sent:"),
                                          Text(
                                            "Yes",
                                            style: TextStyle(
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          20.verticalSpace,

                          ///
                          /// Container Column 2nd Section
                          ///
                          Text(
                            "Remedies",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //10.verticalSpace,
                          formulaData == null && formulaData!.isEmpty
                              ? Center(child: Text("There is no remidies"))
                              : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    formulaData![this.index].remedies?.length ??
                                    0,
                                itemBuilder: (context, remedyIndex) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 4,
                                          offset: Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            "$dynamicAssets/flower.png",
                                          ),
                                          radius: 16,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "${formulaData![this.index].remedies![remedyIndex].name}" ??
                                              "",
                                          style: TextStyle(
                                            color: blackColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                          10.verticalSpace,
                          Text(
                            "Dosage",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          4.verticalSpace,
                          Text("${formulaData![index].dosage}" ?? ""),
                          10.verticalSpace,
                          Text(
                            "Notes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          4.verticalSpace,
                          Text("${formulaData![index].notes}" ?? ""),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
