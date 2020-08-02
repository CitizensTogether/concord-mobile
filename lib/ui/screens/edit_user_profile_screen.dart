import 'package:concord/core/models/user_profile_model.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:concord/ui/widgets/tags.dart';
import 'package:concord/ui/widgets/submit_button.dart';
import 'package:concord/ui/widgets/input_field.dart';
import 'package:concord/ui/screens/user_profile_screen.dart';

/// User profile screen
class EditUserProfileScreen extends StatelessWidget {
  final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                ),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfileScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: _appTheme.secondaryColor,
                        size: 25.0,
                      ),
                    ),
                    Container(
                      width: 87.0,
                      height: 89.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(model.profilePicture),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "change profile picture",
                  style: TextStyle(
                    color: _appTheme.themeData.accentColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "PUBLIC INFORMATION",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 10,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                ),
                Text(
                  "Name",
                  style: TextStyle(color: _appTheme.mainText, fontSize: 16),
                ),
                InputField(
                    backgroundColor: _appTheme.secondaryColor.withOpacity(0.19),
                    text: model.name,
                    textColor: _appTheme.secondaryColor),
                Text(
                  "Skills",
                  style: TextStyle(color: _appTheme.mainText, fontSize: 16),
                ),
                TagPicker(
                  textFieldEnabled: true,
                  removable: true,
                  borderColor: _appTheme.themeData.accentColor,
                  chipColor: _appTheme.secondaryColor,
                  removeButtonColor: _appTheme.mainText,
                  textColor: _appTheme.mainMono,
                  initTags: model.skills,
                  hintText: "Add a certification",
                  horizontalScrollEnabled: true,
                ),
                Text(
                  "PRIVATE INFORMATION",
                  style: TextStyle(
                    color: _appTheme.themeData.primaryTextTheme.bodyText1.color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.75,
                    fontSize: 14,
                  ),
                ),
                Divider(
                  color: _appTheme.themeData.primaryTextTheme.bodyText1.color,
                  height: 10,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                ),
                Text(
                  "Email",
                  style: TextStyle(color: _appTheme.mainText, fontSize: 16),
                ),
                InputField(
                  backgroundColor: _appTheme.secondaryColor.withOpacity(0.19),
                  text: model.email,
                  textColor: _appTheme.secondaryColor,
                ),
                Text(
                  "Phone Number",
                  style: TextStyle(
                    color: _appTheme.mainText,
                    fontSize: 16,
                  ),
                ),
                InputField(
                  backgroundColor: _appTheme.secondaryColor.withOpacity(0.19),
                  text: model.phoneNumber,
                  textColor: _appTheme.secondaryColor,
                ),
                SubmitButton(
                  text: "SAVE",
                  backgroundColor: _appTheme.secondaryColor,
                  textColor: _appTheme.mainMono,
                  onTap: null,
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => UserProfileModel(),
    );
  }
}
