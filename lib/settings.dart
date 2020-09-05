import 'package:concord/core/models/theme_model.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:concord/theme_notifier.dart';
import 'package:concord/utils/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:concord/ui/widgets/submit_button.dart';

class OrgSettings extends StatefulWidget {
  @override
  _OrgSettingsState createState() => _OrgSettingsState();
}

class _OrgSettingsState extends State<OrgSettings> {
  String _time = "Not set";
  String _time2 = "Not set";

  @override
  Widget build(BuildContext context) {
    // Wrapping Scaffold in ViewModel Builder in order to access model properties and methods
    return ViewModelBuilder<ThemeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Container(
                color: model.appTheme.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //First part of the screen, serves almost as the app bar with a back button
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SafeArea(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 50, 0, 0),
                                      child: null),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'App Settings',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // App Theme portion which allows users to change the theme
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          children: <Widget>[
                            _headerRow(
                              headerText: 'App Theme',
                              fontSize: 20.0,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Row(
                                children: <Widget>[
                                  SubmitButton(
                                    onTap: () {
                                      model.updateThemeToLight();
                                    },
                                    backgroundColor:
                                        model.appTheme.themeData.buttonColor,
                                    textColor: Colors.white,
                                    text: 'LIGHT',
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SubmitButton(
                                    onTap: () {
                                      model.updateThemeToDark();
                                    },
                                    backgroundColor:
                                        model.appTheme.themeData.buttonColor,
                                    textColor: Colors.white,
                                    text: 'DARK',
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Allows users to set their active hours set to 'Not Set' as default
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            _headerRow(
                              headerText: 'Active Hours',
                              fontSize: 20.0,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: <Widget>[
                                SubmitButton(
                                  onTap: () {
                                    DatePicker.showTime12hPicker(
                                      context,
                                      theme: DatePickerTheme(
                                          backgroundColor:
                                              model.appTheme.mainMono),
                                      showTitleActions: true,
                                      onConfirm: (time) {
                                        _time =
                                            '${time.hour > 12 ? time.hour - 12 : time.hour} : ${time.minute}  ${time.hour >= 12 ? 'PM' : 'AM'}';
                                        setState(() {});
                                      },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en,
                                    );
                                    setState(() {});
                                  },
                                  backgroundColor:
                                      model.appTheme.themeData.buttonColor,
                                  textColor: Colors.white,
                                  text: '$_time',
                                  width: 120,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'to',
                                  style: TextStyle(
                                    color: model.appTheme.secondaryColor,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SubmitButton(
                                  onTap: () {
                                    DatePicker.showTime12hPicker(
                                      context,
                                      theme: DatePickerTheme(
                                        backgroundColor:
                                            model.appTheme.mainMono,
                                      ),
                                      showTitleActions: true,
                                      onConfirm: (time2) {
                                        _time2 =
                                            '${time2.hour > 12 ? time2.hour - 12 : time2.hour} : ${time2.minute}  ${time2.hour >= 12 ? 'PM' : 'AM'}';
                                        setState(() {});
                                      },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en,
                                    );
                                    setState(() {});
                                  },
                                  backgroundColor:
                                      model.appTheme.themeData.buttonColor,
                                  textColor: Colors.white,
                                  text: '$_time2',
                                  width: 120,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Static button, with no function that mentions locality served
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Column(
                          children: <Widget>[
                            _headerRow(
                              headerText: 'Locality Served',
                              fontSize: 20.0,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SubmitButton(
                              onTap: () {},
                              backgroundColor:
                                  model.appTheme.themeData.buttonColor,
                              textColor: Colors.white,
                              text: 'Glendale',
                              width: 350,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Login options for the user
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                _headerRow(
                                  headerText: 'Login methods',
                                  fontSize: 20.0,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                            SubmitButton(
                              onTap: () {},
                              backgroundColor:
                                  model.appTheme.themeData.buttonColor,
                              textColor: Colors.white,
                              text: 'Connect Through Google',
                              width: 300,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SubmitButton(
                              onTap: () {},
                              backgroundColor:
                                  model.appTheme.themeData.buttonColor,
                              textColor: Colors.white,
                              text: 'Connect your phone number',
                              width: 300,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => ThemeViewModel());
  }
}

// Extracted a widget for the header of each of the Expanded Widgets (e.g App Theme, Active Hours, etc.)
class _headerRow extends StatelessWidget {
  final String headerText;
  final double fontSize;
  const _headerRow({
    Key key,
    this.headerText,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Text(
          headerText,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
