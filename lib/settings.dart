import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:concord/theme.dart';

class OrgSettings extends StatefulWidget {
  @override
  _OrgSettingsState createState() => _OrgSettingsState();
}

class _OrgSettingsState extends State<OrgSettings> {
  String _time = "Not set";
  String _time2 = "Not set";

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFF6A8CAF),
              child: Column(
                children: <Widget>[
                  SafeArea(
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(15, 50, 0, 0),
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
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFF6A8CAF),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 0, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'App Theme',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              print('Light Button Working');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: Color(0xFF89a4c0),
                            textColor: Colors.white,
                            child: Text("LIGHT".toUpperCase(),
                                style: TextStyle(fontSize: 14)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              print('Dark Button Working');
                            },
                            color: Color(0xFF89a4c0),
                            textColor: Colors.white,
                            child: Text("DARK".toUpperCase(),
                                style: TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFF6A8CAF),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Active Hours',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            " $_time",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {
                            DatePicker.showTime12hPicker(context,
                                theme: DatePickerTheme(),
                                showTitleActions: true, onConfirm: (time) {
                              print('confirm $time');
                              _time =
                                  '${time.hour > 12 ? time.hour - 12 : time.hour} : ${time.minute}  ${time.hour >= 12 ? 'PM' : 'AM'}';
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                            setState(() {});
                          },
                          color: Color(0xFF89a4c0),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'to',
                          style:
                              TextStyle(color: Color(0xFF47627E), fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FlatButton(
                          child: Text(
                            " $_time2",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {
                            DatePicker.showTime12hPicker(context,
                                theme: DatePickerTheme(),
                                showTitleActions: true, onConfirm: (time2) {
                              print('confirm $time2');
                              _time2 =
                                  '${time2.hour > 12 ? time2.hour - 12 : time2.hour} : ${time2.minute}  ${time2.hour >= 12 ? 'PM' : 'AM'}';
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                            setState(() {});
                          },
                          color: Color(0xFF89a4c0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFF6A8CAF),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child: null),
                        Text(
                          'Locality Served: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                          child: FlatButton(
                            onPressed: () {
                              print('Locality Button Working');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: Color(0xFF89a4c0),
                            textColor: Colors.white,
                            child: Text(
                              "Glendale",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Color(0xFF6A8CAF),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 0, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Login methods: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 60, 0),
                          child: FlatButton(
                            onPressed: () {
                              print('Google Button Working!');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: Color(0xFF89a4c0),
                            textColor: Colors.white,
                            child: Text("Connect through Google",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 60, 0),
                          child: FlatButton(
                            onPressed: () {
                              print('Phone # button working!');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: Color(0xFF89a4c0),
                            textColor: Colors.white,
                            child: Text("Connect your phone number",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
