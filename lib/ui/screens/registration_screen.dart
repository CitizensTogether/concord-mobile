import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;

final ConcordThemeData theme = locator<ConcordThemeManager>().theme;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
          child: SingleChildScrollView(
            child:SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Scaffold(
                backgroundColor: theme.secondaryColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      RegistrationHeader(),
                      InputFormFields(),

                    ],
                    ),
                ),
                
              ),
            ),
      ),
    );
  }

}

class RegistrationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,40,0,20),
        child: Center(
          child: Text("Register",
            style: theme.textTheme.headline4.apply(color:theme.secondaryMono, fontSizeFactor:1.25),
            
            ),
        ),
      ),
    );
  }
}

class InputFormFields extends StatefulWidget {
  @override
  _InputFormFieldsState createState() => _InputFormFieldsState();
}

class _InputFormFieldsState extends State<InputFormFields> {
  @override
  static final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    UserInformation userInfo;
    return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Name",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: theme.mainMono),
                      ),
                    ),
                  ),
                  CustomField(
                    hintText: "Name",
                    validator: (String value){
                      if(value == null)
                        return "Please enter a name";
                      return null;
                    },
                    onSaved: (String value){
                      userInfo.name = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Email",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: theme.mainMono),
                      ),
                    ),
                  ),
                  CustomField(
                    hintText: "Email",
                    validator: (String value){
                      if(!validator.isEmail(value))
                        return "Please input a valid email address";
                      return null;
                    },
                    onSaved: (String value){
                      userInfo.email = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: theme.mainMono),
                      ),
                    ),
                  ),
                  CustomField(
                    hintText: "Password",
                    isPassword: true,
                    validator: (String value){
                      if(!validator.isLength(value,8))
                        return "Your password must be at least 8 characters long";
                      return null;
                    },
                    onSaved: (String value){
                      userInfo.password = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Set Active Hours",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: theme.mainMono),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: screenWidth/2,
                        child: Column(
                          children: <Widget>[
                            
                            CustomField(
                              hintText: "Start",
                              onSaved: (String value){
                                userInfo.startTime = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth/2,
                        child: Column(
                          children: <Widget>[
                            
                            CustomField(
                              hintText: "End",
                              onSaved: (String value){
                                userInfo.endTime = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Locality",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: theme.mainMono),
                      ),
                    ),
                  ),
                  CustomField(
                    hintText: "Locality",
                    onSaved: (String value){
                      userInfo.locality = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Phone Number",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: theme.mainMono),
                      ),
                    ),
                  ),
                  CustomField(
                    hintText: "Phone Number",
                    validator: (String value){
                      if(!validator.isLength(value,10,10))
                        return "Please input a valid phone number";
                      return null;
                    },
                    onSaved: (String value){
                      userInfo.phoneNumber = value;
                    },
                  ),
                  RaisedButton(
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.secondaryMono,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                      }
                    },
                    color: theme.secondaryText,
                  ),

              ],
      ),
          ),
    );
  }
}

/// An input field with a dark material aesthetic.
class CustomField extends StatefulWidget {
  /// A form hint for the user.
  final String hintText;

  /// A function that checks the validity of this field's contents.
  final Function validator;

  /// Callback triggered when form state is saved.
  final Function onSaved;

  /// if password obscures text
  final bool isPassword;

  /// if email allows email keyboard to appear
  final bool isEmail;

  CustomField(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false});

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  var _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25,0,25,20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: theme.secondaryMono,
        ),
        obscureText: widget.isPassword,
        validator: widget.validator,
        onSaved: widget.onSaved,
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        controller: _myController,
      ),
    );
  }
}

class UserInformation{
  String name;
  String email;
  String password;
  String startTime;
  String endTime;
  String locality;
  String phoneNumber;

  UserInformation({this.name, this.email, this.password, this.startTime, this.endTime, this.locality, this.phoneNumber});

}