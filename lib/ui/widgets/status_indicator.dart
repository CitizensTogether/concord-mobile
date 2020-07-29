import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';

/// A widget to indicate the status of a bulletin.
class StatusIndicator extends StatelessWidget {

  /// A string indicating which of 3 possible status indicators should be drawn.
  /// 
  /// This should only ever be "open", "taken", or "closed". Any other
  /// variation will cause the the status to be defaulted to "closed".
  final String status;

  /// The width and height of the circle above the status text.
  final double width;

  /// The color of the status text.
  final Color textColor;

  static ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  const StatusIndicator({
    Key key,
    @required this.status,
    this.textColor,
    this.width = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == "open") {
      return _openStatus();
    else if( status == "taken")
      return _takenStatus();
    } else {
        return _closedStatus();
    }
  }

  Column _openStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color:_appTheme.urgentColor, width: 2.0)
          ),
        ),
        SizedBox(height: 4.0),
        Text('open!',
          style: TextStyle(
            color: textColor ?? _appTheme.secondaryColor
          )
        )
      ],
    );
  }

  Column _takenStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey
          ),
        ),
        SizedBox(height: 4.0),
        Text('taken',
         style: TextStyle(
            color: textColor ?? _appTheme.secondaryColor
          )
        )
      ],
    );
  }

  Column _closedStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: locator<ConcordThemeManager>().theme.backgroundColor
          ),
          child: Icon(
            Icons.done,
            color: locator<ConcordThemeManager>().theme.mainColor,
          ),
        ),
        SizedBox(height: 4.0),
        Text('closed',
         style: TextStyle(
            color: textColor ?? _appTheme.secondaryColor
          )
        )
      ],
    );
  }
}
