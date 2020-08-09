import 'package:concord/core/models/home_model.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// The primary landing page for the Concord app.
class HomeScreen extends StatelessWidget {
  final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(child: Text(model.title)),
              floatingActionButton: FloatingActionButton(
                onPressed: model.updateCounter,
                child: Icon(Icons.add),
                backgroundColor: _appTheme.mainColor,
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
