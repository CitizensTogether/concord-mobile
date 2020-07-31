import 'package:concord/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart' as validator;

/// The primary screen where the user can sign in or sign up for Concord.
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

// Widget state for the [AuthScreen].
class _AuthScreenState extends State<AuthScreen> {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// Stores the size of the screen to avoid multiple queries
    double screenWidth = MediaQuery.of(context).size.width;
    SignUpDetails initialDetails = SignUpDetails();
    ConcordThemeData theme = ConcordThemeManager.lightTheme;

    final Widget formHeader = Padding(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 5),
      child: Text(
        'Welcome!',
        textAlign: TextAlign.center,
        style: GoogleFonts.raleway(
          textStyle: TextStyle(
            color: theme.bannerColor,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final Widget inputFormFields = Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      color: theme.backgroundColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 20),
        child: SizedBox(
          width: screenWidth,
          height: 220,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Column(
                children: <Widget>[
                  Text(
                    'Email or Phone Number:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomField(
                    hintText: 'Email/phone number',
                    isEmail: true,
                    onSaved: (String value) {
                      if (validator.isEmail(value)) {
                        initialDetails.email = value;
                      }
                      if (validator.isNumeric(value) &&
                          validator.isLength(value, 10)) {
                        initialDetails.phoneNum = value;
                      }
                      return null;
                    },
                    validator: (String value) {
                      if (!validator.isEmail(value) ||
                          !validator.isNumeric(value)) {
                        return 'Please enter a valid email or phone';
                      }
                      return null;
                    },
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomField(
                    hintText: 'Password',
                    isPassword: true,
                    onSaved: (String value) {
                      if (validator.isLength(value, 8)) {
                        initialDetails.password = value;
                      }
                      return null;
                    },
                    validator: (String value) {
                      if (!validator.isLength(value, 8)) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: theme.mainColor,
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            child: Column(children: [
              formHeader,
              /// Card description (Sign up with email/phone)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 20, 0, 5),
                  child: Text(
                    'Sign up with email/phone:',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: theme.bannerColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              /// Data input card with text inputs and labels
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: inputFormFields,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                /// Sign Up button using inputted information
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: RaisedButton(
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: theme.secondaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                      }
                    },
                    color: theme.bannerColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'OR',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: theme.bannerColor),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: RaisedButton(
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        'Continue with Google',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: theme.secondaryText,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Implement sign-in with Google auth
                    },
                    color: theme.bannerColor,
                  ),
                ),
              ),
            ]),
          ),
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
    ConcordThemeData theme = ConcordThemeManager.lightTheme;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: theme.mainColor,
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

/// Provides object for basic user information to be stored in before being routed to next screen
class SignUpDetails {
  String email;
  String password;
  String phoneNum;

  SignUpDetails({this.email, this.password, this.phoneNum});
}
