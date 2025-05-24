import 'package:get_it/get_it.dart';
import 'package:lightweaver/core/services/auth_services.dart';
import 'package:lightweaver/core/services/db_services.dart';
import 'package:lightweaver/core/services/local_storage_services.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(LocalStorageServices());
  locator.registerSingleton(DatabaseServices());
  // locator.registerSingleton(NotificationsService());
  locator.registerSingleton(AuthServices());
}
