import 'package:concord/ui/widgets/concord_tiles.dart';
import 'package:concord/ui/widgets/layout_widgets.dart';
import 'package:concord/ui/widgets/submit_button.dart';
import 'package:concord/ui/widgets/tags.dart';
import 'package:flutter/material.dart';
import '../../utils/locator.dart';
import '../theme/theme.dart';

/// The details screen for a community bulletin that is still open. 
class RequestDetails extends StatelessWidget {
  const RequestDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SubmitButton(
            onTap: null,
            backgroundColor: _appTheme.mainColor,
            textColor: _appTheme.bannerColor,
          ),
          TagPicker()
        ],
      )
    );
  }
}