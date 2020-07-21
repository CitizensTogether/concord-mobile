import 'package:concord/ui/theme/theme.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  // Register lazy singletons here
  locator.registerLazySingleton(() => ConcordThemeManager());
}
