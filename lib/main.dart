import 'package:concord/main_screen.dart';
import 'package:concord/organizations_page.dart';
import 'package:concord/settings.dart';
import 'package:concord/ui/screens/home_screen.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:concord/ui/widgets/concord_tiles.dart';
import 'ui/screens/request_details_screen.dart';

/// Initialize the app.
void main() {
  setupLocator();
  runApp(
    ChangeNotifierProvider<ConcordThemeManager>(
      create: (_) => ConcordThemeManager(),
      child: Concord(),
    ),
  );
}
/* void main() => runApp(
  ChangeNotifierProvider<ThemeNotifier>(
    builder: (_) => ThemeNotifier(darkTheme),
    child: MyApp(),
  ),
); */

void test() {
  print('Hello!');
}

/// The primary Concord application instance.
class Concord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConcordThemeManager>.value(
      value: locator<ConcordThemeManager>(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'Concord',
        // For testing, change the assignment of home to be whatever screen you're working on
        // Example: home: AuthScreen()
        home: OrgSettings(),
      ),
    );
  }
}
