import 'package:concord/core/models/user_profile_model.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:concord/ui/widgets/tags.dart';
import 'package:concord/ui/widgets/badges.dart';
import 'package:concord/ui/widgets/concord_tiles.dart';
import 'package:concord/ui/widgets/layout_widgets.dart';
import 'package:concord/ui/screens/edit_user_profile_screen.dart';

/// Organization details profile screen
class UserProfileScreen extends StatelessWidget {
  final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Container(
              color: _appTheme.themeData.primaryColor,
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
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
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditUserProfileScreen(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          color: _appTheme.secondaryColor,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        model.name,
                        style: TextStyle(
                          color: _appTheme.mainMono,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Hours volunteered: ",
                        style: TextStyle(
                          color: _appTheme.mainText,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        model.hoursDone.toString(),
                        style: TextStyle(
                          color: _appTheme.mainMono,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Total requests completed: ",
                        style: TextStyle(
                          color: _appTheme.mainText,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        model.requestsDone.toString(),
                        style: TextStyle(
                          color: _appTheme.mainMono,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SectionBanner(
                    title: "Certifications & Skills",
                    fontSize: 24.0,
                  ),
                  TagPicker(
                    textFieldEnabled: false,
                    removable: false,
                    initTags: model.skills,
                    horizontalScrollEnabled: true,
                    hintText: null,
                  ),
                  SectionBanner(
                    title: "Badges",
                    fontSize: 24.0,
                  ),
                  Badges(badges: model.badges),
                  SectionBanner(
                    title: "Requests posted",
                    fontSize: 24.0,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: model.postedRequests.length,
                    itemBuilder: (context, index) {
                      return Completed(
                        title: model.postedRequests[index]['title'],
                        description: model.postedRequests[index]['description'],
                        textColor: _appTheme.mainMono,
                        onTap: null,
                        backgroundColor: _appTheme.themeData.primaryColor,
                      );
                    },
                  ),
                  SectionBanner(
                    title: "Requests completed",
                    fontSize: 24.0,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: model.completedRequests.length,
                    itemBuilder: (context, index) {
                      return Completed(
                        title: model.completedRequests[index]['title'],
                        description: model.completedRequests[index]['description'],
                        textColor: _appTheme.mainMono,
                        onTap: null,
                        backgroundColor: _appTheme.themeData.primaryColor,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => UserProfileModel(),
    );
  }
}
