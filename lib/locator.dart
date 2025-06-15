import 'package:get_it/get_it.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/core/services/db_services.dart';
import 'package:lightweaver/core/services/file_picker.dart';
import 'package:lightweaver/core/services/local_storage_services.dart';
import 'package:lightweaver/core/services/notification_services.dart';
import 'package:lightweaver/core/services/storage_services.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(LocalStorageServices()); // ✅ local storage
  locator.registerSingleton(DatabaseServices()); // ✅ Firestore service
  locator.registerSingleton(NotificationsService()); // ✅ Notification service
  locator.registerSingleton(AuthServices()); // ✅ Firebase Auth
  locator.registerSingleton(FilePickerService()); // ✅ File/image picker
  locator.registerSingleton(StorageService()); // ✅ Firebase Storage uploader
}
