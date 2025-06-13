// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/model/cleint_profile.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/custom_widget/custom_backround_stack.dart';
import 'package:lightweaver/ui/my_formulas/my_formulas_view_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class MyFormulasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyFormulasViewModel(),
      child: Consumer<MyFormulasViewModel>(
        builder:
            (context, model, child) => ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: Scaffold(
                resizeToAvoidBottomInset: true, // <- This is important
                body: SafeArea(
                  child: GestureDetector(
                    onTap:
                        () =>
                            FocusScope.of(
                              context,
                            ).unfocus(), // Tap outside to close keyboard
                    child: SingleChildScrollView(
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
              onChanged: (value) {
                model.formulaModel.formulaName = value;
              },

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
            DropdownButtonFormField<ClientProfile>(
              isExpanded: true,
              value: model.selectedClient,
              icon: Icon(Icons.keyboard_arrow_down, color: blackColor),
              decoration: authFieldDecoration.copyWith(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                filled: true,
              ),
              hint: Text("Select a client..."),
              items:
                  model.clients.map((client) {
                    return DropdownMenuItem<ClientProfile>(
                      value: client,
                      child: Text(client.name ?? "Unnamed"),
                    );
                  }).toList(),

              onChanged: (value) {
                model.selectedClient = value;
                model.formulaModel.clientName =
                    model.selectedClient?.name ?? '';
              },
            ),

            15.verticalSpace,
            Text(
              "Select Remedies",
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
              child:
                  model.selectedRemedies.isEmpty
                      ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No remedies selected"),
                          Text("Search and add remedies from the left panel"),
                        ],
                      )
                      : Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            model.selectedRemedies.map((remedy) {
                              return Chip(
                                backgroundColor: primaryColor,
                                label: Text(
                                  remedy.name ?? '',
                                  style: style14.copyWith(color: whiteColor),
                                ),
                                deleteIcon: Icon(
                                  Icons.close_rounded,
                                  color: redColor,
                                ),
                                onDeleted: () {
                                  model.toggleRemedySelection(remedy);
                                },
                              );
                            }).toList(),
                      ),
            ),

            15.verticalSpace,
            Text(
              "Dosage",
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            TextFormField(
              onChanged: (value) {
                model.formulaModel.dosage = value;
              },
              decoration: authFieldDecoration.copyWith(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Enter the dosage Name',
                filled: true,
              ),
            ),

            Text("Notes"),
            5.verticalSpace,
            TextFormField(
              maxLines: 4,
              onChanged: (value) {
                model.formulaModel.notes = value;
              },

              decoration: authFieldDecoration.copyWith(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ), // Use primaryColor for focused border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: borderColor),
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
              onTap: () async {
                await model.saveFormula();
              },
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
              onChanged: (val) {
                model.searchRemedies(val);
              },
              decoration: authFieldDecoration.copyWith(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search remedies...',
                fillColor: Colors.grey.shade100,
                filled: true,
                suffixIcon: Icon(Icons.search, color: blackColor, size: 20),
              ),
            ),
            10.verticalSpace,

            model.searchQuery.isNotEmpty && model.filteredRemedies.isEmpty
                ? Center(child: Text("No remedies match your search."))
                : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      model.filteredRemedies.isNotEmpty
                          ? model.filteredRemedies.length
                          : model.allRemediesFlat.length,
                  itemBuilder: (context, index) {
                    final remediesList =
                        model.filteredRemedies.isNotEmpty
                            ? model.filteredRemedies
                            : model.allRemediesFlat;

                    final remedy = remediesList[index];
                    final isSelected = model.selectedRemedies.contains(remedy);

                    return GestureDetector(
                      onTap: () {
                        final remedy = remediesList[index];
                        model.toggleRemedySelection(remedy);
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
                              backgroundImage: NetworkImage(remedy.image ?? ""),
                              radius: 16,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                remedy.name ?? "",
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
          ],
        ),
      ),
    );
  }
}
