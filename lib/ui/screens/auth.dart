import 'package:concord/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart' as validator;
 


class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

/// This is the state for the widget and includes the build function for the application.
class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    /// Stores the size of the screen to avoid multiple queries
    double ScreenWidth = MediaQuery.of(context).size.width;

    /// stores form key
    final formKey = GlobalKey<FormState>();
    SignUpDetails initialDetails = SignUpDetails();
    ConcordThemeData theme = ConcordThemeManager.lightTheme;
    
    /// main widget
    return Scaffold(
      backgroundColor: theme.mainColor,

      /// Header (Welcome!)
      body: Container(
        
        child: SingleChildScrollView(
          child: SizedBox(
            width: ScreenWidth,
            child: Column(children: [
              Padding(
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
              ),

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
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      /// padding around card
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Card(
                        /// card to hold inputs
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(6)),
                        color: theme.backgroundColor,
                        child: Padding(
                          /// internal card padding
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 20),
                          child: SizedBox(
                            /// determines card size
                            width: ScreenWidth,
                            height: 220,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                /// padding between inputs
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                child: Column(
                                  children: <Widget>[
                                    Text('Email or Phone Number:', style: TextStyle(fontWeight: FontWeight.bold)),
                                    CustomField(
                                      hintText: 'email/phone',
                                      isEmail: true,
                                      onSaved: (String value) {
                                        if (validator.isEmail(value)) {
                                          /// saves appropriate values to the initialDetails object
                                          initialDetails.email = value;
                                        }
                                        if (validator.isNumeric(value) &&
                                            validator.isLength(value, 10)) {
                                          initialDetails.phoneNum = value;
                                        }
                                        return null;
                                      },
                                      validator: (String value) {
                                        /// checks to make sure that a valid email or phone number is provided
                                        if (!validator.isEmail(value) &&
                                            !(validator.isNumeric(value) &&
                                                validator.isLength(value, 10))) {
                                          return 'Please enter a valid email or phone';
                                        }
                                        return null;
                                      },
                                    ),
                                    Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                                    CustomField(
                                      hintText: 'Password',
                                      isPassword: true,
                                      onSaved: (String value) {
                                        if (validator.isLength(value, 8)) {
                                          /// saves password to initialDetails object
                                          initialDetails.password = value;
                                        }
                                        return null;
                                      },
                                      validator: (String value) {
                                        /// makes sure that the password is at least 8 characters long
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
                      ),
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
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                              }

                              /// Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(initialDetails))//pushes the data from the object into the registeration screen
                            },
                            color: theme.bannerColor,
                          ))),
                ]),
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
                /// Sign up with Google Authorization
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: RaisedButton(
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        'continue with Google',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: theme.secondaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                    ),
                    onPressed: () {
                      /// for later use with google auth backend
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

/// Creates a custom input field to offer the dark material aesthetic instead of general line entry.
class CustomField extends StatelessWidget {

/// text to be overwritten
  String hintText;

   /// accepts function to validate input data using validators package
  Function validator;

 /// function called upon saving FormState
  Function onSaved;

  /// if password obscures text
  bool isPassword;

  /// if email allows email keyboard to appear
  bool isEmail;

  CustomField(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false});

  @override
  Widget build(BuildContext context) {
    ConcordThemeData theme = ConcordThemeManager.lightTheme;
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.all(15.0),
              border: InputBorder.none,
              filled: true,
              fillColor: theme.mainColor),
          obscureText: isPassword ? true : false,
          validator: validator,
          onSaved: onSaved,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
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
