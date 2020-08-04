import 'package:concord/ui/widgets/concord_tiles.dart';
import 'package:concord/ui/widgets/layout_widgets.dart';
import 'package:concord/ui/widgets/request_details_card.dart';
import 'package:concord/ui/widgets/status_indicator.dart';
import 'package:concord/ui/widgets/submit_button.dart';
import 'package:concord/ui/widgets/tags.dart';
import 'package:flutter/material.dart';
import '../../utils/locator.dart';
import '../theme/theme.dart';

/// The details screen for a community bulletin that is still open. 
class RequestDetailsScreen extends StatelessWidget {

  static ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _headerRow(context),
                RequestData(),
                _actionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// The back button, request tile, request statistics, and status indicator.
  Row _headerRow(BuildContext context) {
    return Row(
      children: <Widget>[

        // Left arrow back button to navigate to previous page in navigation route
        IconButton(
          icon: Icon(Icons.arrow_back,
            color: _appTheme.mainText,
            size: 30
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),

        // Title and statistics
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pick up laundry and donuts',
                softWrap: true,
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              SizedBox( height: 4.0),
              Text(
                "Expires May 7th | People Required: 3/7",
                style: TextStyle(color: _appTheme.secondaryColor),
              )
            ],
          ),
        ),

        //Status indicator
        StatusIndicator(status: "open"),
        SizedBox(width: 8.0)
      ],
    );
  }

  /// The accept request button and a "not interested" text.
  Widget _actionButtons() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SubmitButton(
            onTap: null,
            text: "ACCEPT"
          ),
          SizedBox(height: 4.0),
          GestureDetector(
            onTap: null,
            child: Text(
              'not interested',
              style: TextStyle(
                color: _appTheme.mainText,
                fontSize: 13
              )
            )
          )
        ],
      ),
    );
  }
}
