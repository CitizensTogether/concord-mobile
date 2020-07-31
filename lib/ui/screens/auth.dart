import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart' as validator;
/*
Class name: Auth Widget
Version: 0.1
Author: Eric Boysen
Description:  This widget acts as the route for the Auth Screen for Concord's mobile application
*/

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}


///This is the state for the widget and includes the build function for the application
class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    //stores the size of the screen to avoid multiple queries
    double ScreenWidth = MediaQuery.of(context).size.width;
    //stores form key
    final formKey = GlobalKey<FormState>();
    SignUpDetails initialDetails = SignUpDetails();

    //main widget
    return Scaffold(
        backgroundColor: Color(0xFF75b79e),
        //Header (Welcome!)
        body: Container(
            color: Color(0xFF75b79e),
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
                              color: Color(0xFFEEF9BF),
                              fontSize: 42,
                            )),
                          )),

                      //Card description (Sign up with email/phone)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 20, 0, 5),
                          child: Text(
                            'Sign up with email/phone:',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              color: Color(0xFFEEF9BF),
                              fontSize: 16,
                            )),
                          ),
                        ),
                      ),

                      //Data input card with text inputs and labels
                      Form(
                          key: formKey,
                          child: Column(children: <Widget>[
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    //padding around card
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                    child: Card(
                                        //card to hold inputs
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        color: Color(0xFFafd9bb),
                                        child: Padding(
                                            //internal card padding
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 5, 20),
                                            child: SizedBox(
                                                //determines card size
                                                width: ScreenWidth,
                                                height: 220,
                                                child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Padding(
                                                        //padding between inputs
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 0, 5, 5),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text(
                                                                'Email or Phone Number:'),
                                                            CustomField(
                                                              hintText:
                                                                  'email/phone',
                                                              isEmail: true,
                                                              onSaved: (String
                                                                  value) {
                                                                if (validator
                                                                    .isEmail(
                                                                        value)) {
                                                                  //saves appropriate values to the initialDetails object
                                                                  initialDetails
                                                                          .email =
                                                                      value;
                                                                }
                                                                if (validator
                                                                        .isNumeric(
                                                                            value) &&
                                                                    validator
                                                                        .isLength(
                                                                            value,
                                                                            10)) {
                                                                  initialDetails
                                                                          .phoneNum =
                                                                      value;
                                                                }
                                                                return null;
                                                              },
                                                              validator: (String
                                                                  value) {
                                                                //checks to make sure that a valid email or phone number is provided
                                                                if (!validator
                                                                        .isEmail(
                                                                            value) &&
                                                                    !(validator.isNumeric(
                                                                            value) &&
                                                                        validator.isLength(
                                                                            value,
                                                                            10))) {
                                                                  return 'Please enter a valid email or phone';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                            Text('Password'),
                                                            CustomField(
                                                              hintText:
                                                                  'Password',
                                                              isPassword: true,
                                                              onSaved: (String
                                                                  value) {
                                                                if (validator
                                                                    .isLength(
                                                                        value,
                                                                        8)) {
                                                                  //saves password to initialDetails object
                                                                  initialDetails
                                                                          .password =
                                                                      value;
                                                                }
                                                                return null;
                                                              },
                                                              validator: (String
                                                                  value) {
                                                                //makes sure that the password is at least 8 characters long
                                                                if (!validator
                                                                    .isLength(
                                                                        value,
                                                                        8)) {
                                                                  return 'Password must be at least 8 characters';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ],
                                                        )))))))),
                            Align(
                                //Sign Up button using inputted information
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                    child: RaisedButton(
                                      child: SizedBox(
                                          width: 200,
                                          child: Text('Sign Up',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Color(0xFF75b79e),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14)))),
                                      onPressed: () {
                                        if (formKey.currentState.validate()) {
                                          formKey.currentState.save();
                                        }
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(initialDetails))//pushes the data from the object into the registeration screen
                                      },
                                      color: Color(0xFFEEF9BF),
                                    ))),
                          ])),

                      Center(
                          child: Text('OR',
                              style: GoogleFonts.roboto(
                                  textStyle:
                                      TextStyle(color: Color(0xFFEEF9BF))))),

                      Align(
                          //Sign up with Google Authorization
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: RaisedButton(
                                child: SizedBox(
                                    width: 200,
                                    child: Text('continue with Google',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Color(0xFF75b79e),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)))),
                                onPressed: () {
                                  //for later use with google auth backend
                                },
                                color: Color(0xFFEEF9BF),
                              ))),
                    ])))));
  }
}

class CustomField extends StatelessWidget {
  // creates a custom input feild to offer the dark material asthetic instead of general line entry
  String hintText; //text to be overwritten
  Function validator; //function to validate data
  Function onSaved; //function to act upon saving FormState
  bool isPassword; //if password obscures text
  bool isEmail; //if email allows email keyboard to appear

  CustomField(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.all(15.0),
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xE05d937e)),
          obscureText: isPassword ? true : false,
          validator: validator,
          onSaved: onSaved,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
        ));
  }
}

/*
Title: Sign Up Details
Description: Provides an object to hold basic information to start registration process and pass info to the registration screen
Author: Eric Boysen
Version: 0.1
*/
class SignUpDetails {
  String email;
  String password;
  String phoneNum;

  SignUpDetails({this.email, this.password, this.phoneNum});
}
