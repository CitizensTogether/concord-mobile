import 'package:flutter/material.dart';

class ConcordThemeManager with ChangeNotifier {
  ConcordThemeData _currentTheme = lightTheme;

  ConcordThemeData get theme => _currentTheme;

  //light theme data
  static const Color offWhite = Color(0xFFFFFCF2);
  static const Color lightPink = Color(0xFFFEEFE9);
  static const Color red = Color(0xFFFB8282);
  static const Color yellowGreen = Color(0xFFEEF9BF);
  static const Color limeGreen = Color(0xFFA7E9AF);
  static const Color mossGreen = Color(0xFF75b79E);
  static const Color blue = Color(0xFF6A8CAF);
  static const Color blueText = Color(0xFF47627E);
  static const Color greenText = Color(0xFF5D937E);

  static ConcordThemeData lightTheme = ConcordThemeData(
      themeData: ThemeData(
        primaryColor: mossGreen,
        brightness: Brightness.light,
        fontFamily: 'Lato',
        buttonColor: mossGreen,
      ),
      mainText: blueText,
      secondaryText: greenText,
      mainColor: mossGreen,
      secondaryColor: blue,
      backgroundColor: limeGreen,
      bannerColor: yellowGreen,
      urgentColor: red,
      mainMono: offWhite,
      secondaryMono: lightPink);

  //dark theme data
  static ConcordThemeData darkTheme = ConcordThemeData(
      themeData: ThemeData(
        primaryColor: Color(0xFF444444),
        brightness: Brightness.dark,
        fontFamily: 'Lato',
        buttonColor: blueText,
      ),
      mainText: Colors.red,
      secondaryText: greenText,
      mainColor: mossGreen,
      secondaryColor: blue,
      backgroundColor: Colors.black,
      bannerColor: Colors.blueGrey,
      urgentColor: red,
      mainMono: Color(0xFF43464b),
      secondaryMono: lightPink);

  changeToLight() {
    _currentTheme = lightTheme;
    notifyListeners();
  }

  changeToDark() {
    _currentTheme = darkTheme;
    notifyListeners();
  }
}

class ConcordThemeData {
  final ThemeData themeData;

  final Color mainText;
  final Color secondaryText;

  final Color mainColor;
  final Color secondaryColor;

  final Color backgroundColor;
  final Color bannerColor;

  final Color urgentColor;

  final Color mainMono;
  final Color secondaryMono;

  Color opposite;
  Color antiOpposite;

  ConcordThemeData(
      {@required this.themeData,
      @required this.mainText,
      @required this.secondaryText,
      @required this.mainColor,
      @required this.secondaryColor,
      @required this.backgroundColor,
      @required this.bannerColor,
      @required this.urgentColor,
      @required this.mainMono,
      @required this.secondaryMono}) {
    opposite =
        themeData.brightness == Brightness.dark ? Colors.white : Colors.black;
    antiOpposite =
        themeData.brightness == Brightness.dark ? Colors.black : Colors.white;
  }
}
