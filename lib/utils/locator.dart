import 'package:concord/ui/theme/theme.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  //register lazy singletons here
  locator.registerLazySingleton(() => ConcordThemeManager());
}
