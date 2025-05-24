import 'package:lightweaver/core/others/base_view_model.dart';

class CloudViewModel extends BaseViewModel {
  bool isCloudSyncEnabled = true;
  Map<String, bool> syncOptions = {
    'Documents': true,
    'Images': true,
    'Settings': true,
  };

  void toggleCloudSync(bool value) {
    isCloudSyncEnabled = value;
    notifyListeners();
  }

  void toggleSyncOption(String key, bool value) {
    syncOptions[key] = value;
    notifyListeners();
  }
}
