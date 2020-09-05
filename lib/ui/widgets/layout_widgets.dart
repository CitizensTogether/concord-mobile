import 'package:flutter/material.dart';

import '../../utils/locator.dart';
import '../theme/theme.dart';

/// A rectangular section header to help organize pages in blocks.
class SectionBanner extends StatelessWidget {
  final String title;
  final Color bannerColor;
  final Color titleColor;
  final double fontSize;

  const SectionBanner(
      {Key key,
      @required this.title,
      this.bannerColor,
      this.titleColor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

    return Container(
        color: bannerColor ?? _appTheme.bannerColor,
        padding: EdgeInsets.fromLTRB(20, 8, 36, 8),
        child: Text(title,
            style: TextStyle(
                fontSize: fontSize ?? 34,
                fontWeight: FontWeight.bold,
                color: titleColor ?? _appTheme.secondaryColor)));
  }
}
