import 'package:concord/ui/screens/home_screen.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(Concord());
}

class Concord extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<ConcordThemeManager>(),
      child: MaterialApp(
        title: 'Concord',
        //for testing, change the assignment of home to be whatever screen you're working on
        //ex. home: AuthScreen()
        home: HomeScreen(),
      ),
    );
  }
}
