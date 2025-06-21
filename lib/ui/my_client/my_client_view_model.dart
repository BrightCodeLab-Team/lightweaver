// ignore_for_file: use_function_type_syntax_for_parameters

import 'dart:io';
import 'package:get/get.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/model/cleint_profile.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/db_services.dart';
import 'package:lightweaver/core/services/file_picker.dart';
import 'package:lightweaver/custom_widget/snack_bar/custom_snack_bar.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/root_screen/root_screen.dart';

class MyClientViewModel extends BaseViewModel {
  String selectedAgeGroup = 'Age Group';
  String selectedVisit = 'Newest First';

  final _dbServices = locator<DatabaseServices>();

  ClientProfile clientProfile = ClientProfile();
  List<ClientProfile>? clientData;
  final filePickerService = FilePickerService();

  MyClientViewModel() {
    getClinets();
  }

  Future<void> pickClientImage() async {
    File? imageFile = await filePickerService.pickImage();
    if (imageFile != null) {
      clientProfile.imagePath = imageFile.path;
      notifyListeners(); // or update UI
    }
  }

  addClient() async {
    setState(ViewState.busy);

    final response = await _dbServices.addClientProfile(clientProfile);
    if (response != null) {
      customSnackbar(
        title: "Sucessfully",
        message: 'Client Profile Added Sucessfully',
      );

      await getClinets();

      Get.offAll(() => RootScreen(selectedScreen: 1));
    } else {
      customSnackbar(title: "Error", message: 'Client Profile Added Failed');
    }
    setState(ViewState.idle);
    notifyListeners(); // or update UI
  }

  getClinets() async {
    setState(ViewState.busy);
    await Future.delayed(Duration(seconds: 2));
    final result = await _dbServices.getAllClientProfiles();
    if (result.isNotEmpty && result != null) {
      clientData = result;
      print("Client data get Sucessfully");
    } else {
      print("Client data get Failed");
    }
    setState(ViewState.idle);
    notifyListeners(); // or update UI
  }

  final List<String> ageGroups = [
    'Age Group',
    '18-25',
    '26-35',
    '36-45',
    '46+',
  ];
  final List<String> visitFilters = [
    'Newest First',
    'Last Visit',
    'Oldest First',
  ];

  // List<ClientProfile> get filteredClienData {
  //   final list = List<ClientProfile>.from(clientData!);
  //   switch (selectedVisit) {
  //     case 'Newest First':
  //       list.sort((a, b) => b.createdAt!.compareTo(a.date!));
  //       break;
  //     case 'Oldest First':
  //       list.sort((a, b) => a.date!.compareTo(b.date!));
  //       break;
  //     case 'Last Visit':
  //     default:
  //       // Optionally keep original or sort by most recent visit logic
  //       break;
  //   }
  //   return list;
  // }

  List<ClientProfile> get filteredClientData {
    List<ClientProfile> filtered = clientData ?? [];

    // Age Group Filter
    if (selectedAgeGroup != 'Age Group') {
      switch (selectedAgeGroup) {
        case '18-25':
          filtered =
              filtered
                  .where((c) => c.age != null && c.age! >= 18 && c.age! <= 25)
                  .toList();
          break;
        case '26-35':
          filtered =
              filtered
                  .where((c) => c.age != null && c.age! >= 26 && c.age! <= 35)
                  .toList();
          break;
        case '36-45':
          filtered =
              filtered
                  .where((c) => c.age != null && c.age! >= 36 && c.age! <= 45)
                  .toList();
          break;
        case '46+':
          filtered =
              filtered.where((c) => c.age != null && c.age! >= 46).toList();
          break;
      }
    }

    // 2. Apply Visit Sorting
    filtered.sort((a, b) {
      final da = a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      final db = b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      switch (selectedVisit) {
        case 'Newest First':
          return db.compareTo(da);
        case 'Oldest First':
          return da.compareTo(db);
        case 'Last Visit':
        default:
          return 0; // no sorting
      }
    });

    return filtered;
  }
}
