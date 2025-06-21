// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/ui/my_client/my_client_view_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class NewClientProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<MyClientViewModel>(
      builder:
          (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            progressIndicator: CircularProgressIndicator(),
            child: Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Stack(
                      children: [
                        Image.asset(AppAssets().setting2Screen),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.orange,
                              size: 30,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.orange,
                            size: 30,
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 80),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor.withOpacity(0.2),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Client Profile",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 45,
                                          backgroundColor: Colors.grey.shade300,
                                          backgroundImage:
                                              model.clientProfile.imagePath !=
                                                      null
                                                  ? FileImage(
                                                    File(
                                                      model
                                                          .clientProfile
                                                          .imagePath!,
                                                    ),
                                                  )
                                                  : null,
                                          child:
                                              model.clientProfile.imagePath ==
                                                      null
                                                  ? const Icon(
                                                    Icons.person,
                                                    size: 40,
                                                    color: Colors.white,
                                                  )
                                                  : null,
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              model.pickClientImage();
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 14,
                                              child: Icon(
                                                Icons.edit,
                                                color: Colors.orange,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _buildField(
                                    text: "Client Name",
                                    initialValue:
                                        model.clientProfile.name ?? "",
                                    validator:
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'Name is required'
                                                : null,
                                    onChanged:
                                        (value) =>
                                            model.clientProfile.name = value,
                                  ),
                                  _buildField(
                                    text: "Age",
                                    initialValue:
                                        (model.clientProfile.age ?? 0)
                                            .toString(),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Age is required';
                                      }
                                      final age = int.tryParse(value);
                                      if (age == null ||
                                          age <= 0 ||
                                          age > 120) {
                                        return 'Enter a valid age';
                                      }
                                      return null;
                                    },

                                    onChanged:
                                        (value) =>
                                            model.clientProfile.age =
                                                int.tryParse(value) ?? 0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Gender",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        DropdownButtonFormField<String>(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: primaryColor,
                                          ),
                                          value:
                                              model
                                                          .clientProfile
                                                          .gender
                                                          ?.isNotEmpty ==
                                                      true
                                                  ? model.clientProfile.gender
                                                  : null,
                                          hint: const Text("Select Gender"),
                                          items:
                                              ["Male", "Female", "Other"]
                                                  .map(
                                                    (gender) =>
                                                        DropdownMenuItem<
                                                          String
                                                        >(
                                                          value: gender,
                                                          child: Text(gender),
                                                        ),
                                                  )
                                                  .toList(),
                                          onChanged: (value) {
                                            if (value != null) {
                                              model.clientProfile.gender =
                                                  value;
                                            }
                                          },
                                          validator:
                                              (value) =>
                                                  value == null || value.isEmpty
                                                      ? 'Gender is required'
                                                      : null,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 10,
                                                ),
                                            filled: true,
                                            fillColor: Colors.grey.shade100,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildField(
                                    text: "Phone",
                                    initialValue:
                                        model.clientProfile.phone ?? "",
                                    validator:
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'Phone number required'
                                                : null,
                                    onChanged:
                                        (value) =>
                                            model.clientProfile.phone = value,
                                  ),
                                  _buildField(
                                    text: "Email",
                                    initialValue:
                                        model.clientProfile.email ?? "",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      final emailRegex = RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                                      );
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Enter a valid email address';
                                      }
                                      return null;
                                    },

                                    onChanged:
                                        (value) =>
                                            model.clientProfile.email = value,
                                  ),
                                  _buildField(
                                    text: "Date of Birth",
                                    initialValue:
                                        model.clientProfile.dateOfBirth ?? "",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Date of Birth is required';
                                      }
                                      final dateRegEx = RegExp(
                                        r'^(\d{2})\/(\d{2})\/(\d{4})$',
                                      );
                                      if (!dateRegEx.hasMatch(value)) {
                                        return 'Enter date in DD/MM/YYYY format';
                                      }
                                      return null;
                                    },

                                    onChanged:
                                        (value) =>
                                            model.clientProfile.dateOfBirth =
                                                value,
                                  ),

                                  const SizedBox(height: 20),
                                  const Text(
                                    "Notes",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      "This client has shown good progress in the last 3 sessions.",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          await model.addClient();
                                        }
                                      },

                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 30,
                                        ),
                                      ),
                                      child: const Text(
                                        "Save Changes",
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
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

  Widget _buildField({
    required String text,

    required String initialValue,
    required String? Function(String?)? validator,
    required void Function(String) onChanged,
  }) {
    String getHintText(String label) {
      switch (label) {
        case "Phone":
          return "(123) 456-7890";
        case "Email":
          return "example@mail.com";
        case "Date of Birth":
          return "DD/MM/YYYY";
        case "Age":
          return "e.g. 30";
        case "Gender":
          return "Male / Female / Other";
        case "Client Name":
          return "Awais khan";
        default:
          return label;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 5),
          TextFormField(
            initialValue: initialValue,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: getHintText(text),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
