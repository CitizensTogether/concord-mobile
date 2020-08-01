import 'package:flutter/material.dart';

/// A service to help dynamically change the theme at runtime
class ConcordThemeManager with ChangeNotifier {

  /// The default theme of the app 
  ConcordThemeData _currentTheme = lightTheme;

  /// A getter for the current theme
  ConcordThemeData get theme => _currentTheme;

  /// A customized typography for the app
  static const TextTheme concordTextTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: "Raleway",
      fontSize: 96,
      fontWeight: FontWeight.w400,
    ),
    headline2: TextStyle(
      fontFamily: "Raleway",
      fontSize: 60,
      fontWeight: FontWeight.w400,
    ),
    headline3: TextStyle(
      fontFamily: "Raleway",
      fontSize: 48,
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      fontFamily: "Raleway",
      fontSize: 34,
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      fontFamily: "Raleway",
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headline6: TextStyle(
      fontFamily: "Raleway",
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    bodyText1: TextStyle(
      fontFamily: "Lato",
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      fontFamily: "Lato",
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: TextStyle(
      fontFamily: "Lato",
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: TextStyle(
      fontFamily: "Lato",
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    button: TextStyle(
      fontFamily: "Raleway",
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    overline: TextStyle(
      fontFamily: "Lato",
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
    caption: TextStyle(
      fontFamily: "Lato",
      fontSize: 12,
      fontWeight: FontWeight.w500
    ),
  );

  /// Light theme data
  static const Color offWhite = Color(0xFFFFFCF2);
  static const Color lightPink = Color(0xFFFEEFE9);
  static const Color red = Color(0xFFFB8282);
  static const Color yellowGreen = Color(0xFFEEF9BF);
  static const Color limeGreen = Color(0xFFA7E9AF);
  static const Color mossGreen = Color(0xFF75b79E);
  static const Color blue = Color(0xFF6A8CAF);
  static const Color blueText = Color(0xFF47627E);
  static const Color greenText = Color(0xFF5D937E);
  /// Light theme
  static ConcordThemeData lightTheme = ConcordThemeData(
      themeData: ThemeData(
        primaryColor: mossGreen,
        brightness: Brightness.light,
        fontFamily: 'Lato',
        buttonColor: mossGreen,
        textTheme: concordTextTheme,
      ),
      mainText: blueText,
      secondaryText: greenText,
      mainColor: mossGreen,
      secondaryColor: blue,
      backgroundColor: limeGreen,
      bannerColor: yellowGreen,
      urgentColor: red,
      mainMono: offWhite,
      secondaryMono: lightPink,
      textTheme: concordTextTheme,
  );

  /// A function to change the app's current theme to the light theme.
  changeToLight() {
    _currentTheme = lightTheme;
    notifyListeners();
  }
}

/// A custom theme data object for the app.
class ConcordThemeData {
  final ThemeData themeData;

  /// The main text colors
  final Color mainText;
  final Color secondaryText;

  /// The most promiinent style colors
  final Color mainColor;
  final Color secondaryColor;

  /// Colors for layout
  final Color backgroundColor;
  final Color bannerColor;

  /// A color to denote urgency 
  final Color urgentColor;

  /// Monochromatic colors to match the theme brightness
  final Color mainMono;
  final Color secondaryMono;

  /// The typography for the theme
  final TextTheme textTheme;

  /// Constants to be able to access black or white depending
  /// on the theme's brightneess.
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
      @required this.secondaryMono,
      @required this.textTheme,}) {
    opposite =
        themeData.brightness == Brightness.dark ? Colors.white : Colors.black;
    antiOpposite =
        themeData.brightness == Brightness.dark ? Colors.black : Colors.white;
  }
}
