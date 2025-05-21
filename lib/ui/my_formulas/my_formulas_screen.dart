import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/strings.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/custom_widget/custom_backround_stack.dart';
import 'package:lightweaver/ui/my_formulas/formula_history/formula_history_screen.dart';
import 'package:lightweaver/ui/my_formulas/my_formulas_view_model.dart';
import 'package:provider/provider.dart';

class MyFormulasScreen extends StatelessWidget {
  const MyFormulasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyFormulasViewModel(),
      child: Consumer<MyFormulasViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomBackgroundStack(
                      title: "Formula Builder",
                      backgroundImage: AppAssets().formulaBuilderScreen,
                    ),
                    _availableRemedies(model),
                    10.verticalSpace,
                    _formulaDetails(model),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
      ),
    );
  }

  _formulaDetails(MyFormulasViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        //height: 400,
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
            Text(
              "Formula Name",
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            TextFormField(
              decoration: authFieldDecoration.copyWith(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Enter formula name...',
                //fillColor: Colors.grey.shade100,
                filled: true,
                //suffixIcon: Icon(Icons.search, color: blackColor, size: 20),
              ),
            ),
            15.verticalSpace,
            Text(
              "Client (Optional)",
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            TextFormField(
              decoration: authFieldDecoration.copyWith(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Select a client...',
                //fillColor: Colors.grey.shade100,
                filled: true,
                //suffixIcon: Icon(Icons.search, color: blackColor, size: 20),
              ),
            ),

            15.verticalSpace,
            Text(
              "Formula Name",
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 120,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text("No remedies selected"),
                  Text("Search and add remedies from the left panel"),
                ],
              ),
            ),

            15.verticalSpace,
            Text(
              "Client (Optional)",
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            TextFormField(
              initialValue: "4 drops, 4 times daily",
              decoration: authFieldDecoration.copyWith(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Select a client...',
                //fillColor: Colors.grey.shade100,
                filled: true,
                //suffixIcon: Icon(Icons.search, color: blackColor, size: 20),
              ),
            ),

            Text("Notes"),
            5.verticalSpace,
            TextFormField(
              maxLines: 3,

              //initialValue: "4 drops, 4 times daily",
              decoration: authFieldDecoration.copyWith(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                hintText: 'Add any notes about this formula...',
                //fillColor: Colors.grey.shade100,
                filled: true,
                //suffixIcon: Icon(Icons.search, color: blackColor, size: 20),
              ),
            ),

            20.verticalSpace,
            CustomButton(
              text: "Save Formula",
              onTap: () {},
              isWigetEnable: true,
              icon: Icons.save,
            ),
            5.verticalSpace,
            CustomButton(
              text: "Send to Client",
              onTap: () {},
              isWigetEnable: true,
              icon: Icons.send,
            ),
          ],
        ),
      ),
    );
  }

  _availableRemedies(MyFormulasViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 450,
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
            Text(
              "Available Remedies",
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            TextFormField(
              decoration: authFieldDecoration.copyWith(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search remedies...',
                fillColor: Colors.grey.shade100,
                filled: true,
                suffixIcon: Icon(Icons.search, color: blackColor, size: 20),
              ),
            ),
            //10.verticalSpace,
            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: model.remedies.length,
                itemBuilder: (context, index) {
                  final isSelected = model.selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      model.selectRemedy(index);
                      Get.to(FormulaHistoryScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.amber : Colors.white,
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
                          Expanded(
                            child: Text(
                              model.remedies[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.add,
                            color: isSelected ? Colors.white : Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
