import 'package:concord/ui/screens/home_screen.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/screens/request_details_screen.dart';
import 'ui/screens/auth.dart';

/// Initialize the app.
void main() {
  setupLocator();
  runApp(Concord());
}

/// The primary Concord application instance.
class Concord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<ConcordThemeManager>(),
      child: MaterialApp(
        title: 'Concord',
        // For testing, change the assignment of home to be whatever screen you're working on
        // Example: home: AuthScreen()
        home: AuthWidget(),
      ),
    );
  }
}
