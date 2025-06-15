import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/model/app_user.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/core/services/db_services.dart';
import 'package:lightweaver/core/services/file_picker.dart';
import 'package:lightweaver/core/services/storage_services.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';
import 'package:lightweaver/ui/root_screen/root_screen.dart';

class SettingViewModel extends BaseViewModel {
  final authServices = locator<AuthServices>();
  final _db = locator<DatabaseServices>();
  final _filePicker = locator<FilePickerService>();
  final _storageService = locator<StorageService>(); // ✅ Registered in locator

  int _selectedIndex = 0;
  bool isthemeSelect = true;
  int get selectedIndex => _selectedIndex;
  AppUser appUser = AppUser();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  SettingViewModel() {
    loadUserData();
  }

  isThemeClick() {
    isthemeSelect = !isthemeSelect;
    notifyListeners();
  }

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<Map<String, String>> templates = [
    {"title": "Welcome Email", "lastEdited": "2 days ago"},
    {"title": "Password Reset", "lastEdited": "2 days ago"},
    {"title": "Weekly Newsletter", "lastEdited": "2 days ago"},
    {"title": "Order Confirmation", "lastEdited": "2 days ago"},
  ];

  Future<void> loadUserData() async {
    setState(ViewState.busy);
    final userId = authServices.user?.uid;
    if (userId != null) {
      appUser = await _db.getAppUser(userId);
      nameController.text = appUser.name ?? "";
      emailController.text = appUser.email ?? "";
      phoneController.text = appUser.phoneNumber ?? "";
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  Future<void> uploadImageToFirebase() async {
    setState(ViewState.busy);
    try {
      final file = await _filePicker.pickImageWithCompression();
      if (file != null) {
        final uid = authServices.user?.uid ?? "";
        final downloadUrl = await _storageService.uploadProfileImage(file, uid);

        appUser.profileImage = downloadUrl; // ✅ Store Firebase URL
        notifyListeners();
        Get.snackbar("Image", "Profile image uploaded successfully");
      }
    } catch (e) {
      Get.snackbar("Error", "Image upload failed: $e");
    }
    setState(ViewState.idle);
  }

  Future<void> updateUserData() async {
    setState(ViewState.busy);

    appUser.name = nameController.text;
    appUser.phoneNumber = phoneController.text;

    final profileData = await _db.updateUser(appUser);

    if (profileData == null) {
      Get.snackbar('Success', 'Profile updated!');
      Get.offAll(() => RootScreen(selectedScreen: 4));
    } else {
      Get.snackbar('Error', 'Failed to update profile');
    }

    setState(ViewState.idle);
  }

  Future<void> lgout() async {
    setState(ViewState.busy);
    final res = await authServices.logout();
    if (res == true) {
      Get.offAll(SignInScreen());
    }
    setState(ViewState.idle);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
