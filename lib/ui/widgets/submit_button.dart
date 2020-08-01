import 'package:flutter/material.dart';
import '../../utils/locator.dart';
import '../theme/theme.dart';

/// A Concord style button to be used at the end of forms and request pages.
class SubmitButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color textColor;
  final Color backgroundColor;
  final double width;

  const SubmitButton({
    Key key,
    this.text = "SUBMIT",
    @required this.onTap,
    this.width = 200,
    this.textColor,
    this.backgroundColor
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

    return InkWell(
      onTap: onTap,
      focusColor: backgroundColor,
      splashColor: _appTheme.secondaryColor,
      child: Container(
        width: width,
        height: 42,
        decoration: BoxDecoration(
          color: backgroundColor ?? _appTheme.mainColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0,3)
            )
          ]
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: textColor ?? _appTheme.bannerColor
            ),
          ),
        ),
      )
    );
  }
}