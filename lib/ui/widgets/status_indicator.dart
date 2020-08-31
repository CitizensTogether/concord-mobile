import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';

/// A widget to indicate the status of a bulletin.
class StatusIndicator extends StatelessWidget {

  /// A string indicating which of 3 possible status indicators should be drawn.
  /// 
  /// This should only ever be "Open", "Taken", or "Fulfilled". Any other
  /// variation will cause the the status to be defaulted to "Fulfilled".
  final String status;

  /// The width and height of the circle above the status text.
  final double width;

  /// The color of the status text.
  final Color textColor;

  /// Controls whether or not to show the status text.
  final bool hideLabelText;

  static ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  const StatusIndicator({
    Key key,
    @required this.status,
    this.hideLabelText = false,
    this.textColor,
    this.width = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => hideLabelText ? _withoutText() : _withText();

  Column _withText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: status == 'Open' ? Border.all(
              color: _appTheme.urgentColor,
              width: 3.0,
            ) : null,
            color: status == 'Open' ? Colors.transparent : 
              status == 'Taken' ? Colors.grey :
              _appTheme.backgroundColor,            
          ),
          child: status == 'Open' || status == 'Taken' ? SizedBox() : 
            Icon(
              Icons.done,
              color: _appTheme.mainColor,
            ),
        ),
        SizedBox(height: 4.0),
        Text(
          status == 'Open' ? 'Open' : 
            status == 'Taken' ? 'Taken' :
            'Fulfilled', 
          style: TextStyle(
            color: textColor ?? _appTheme.secondaryColor,
          ),
        ),
      ],
    );
  }

  Container _withoutText(){
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: status == 'Open' ? Border.all(
          color: _appTheme.urgentColor,
          width: 3.0,
        ) : null,
        color: status == 'Open' ? Colors.transparent : 
          status == 'Taken' ? Colors.grey :
          _appTheme.backgroundColor,            
      ),
      child: status == 'Open' || status == 'Taken' ? null : 
        Icon(
          Icons.done,
          color: _appTheme.mainColor,
        ),
    );
  }
}