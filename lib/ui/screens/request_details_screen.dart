import 'package:concord/ui/widgets/concord_tiles.dart';
import 'package:concord/ui/widgets/layout_widgets.dart';
import 'package:concord/ui/widgets/status_indicator.dart';
import 'package:concord/ui/widgets/submit_button.dart';
import 'package:concord/ui/widgets/tags.dart';
import 'package:flutter/material.dart';
import '../../utils/locator.dart';
import '../theme/theme.dart';

/// The details screen for a community bulletin that is still open. 
class RequestDetails extends StatelessWidget {

  static ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _headerRow(context),
                _midRow(),
                _requestorInformation(),
                _skillsRequired(),
                _images(),
                _updates(),
                _actionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// The back button, request tile, request statistics, and status indicator.
  Row _headerRow(BuildContext context) {
    return Row(
      children: <Widget>[

        // Left arrow back button to navigate to previous page in navigation route
        IconButton(
          icon: Icon(Icons.arrow_back,
            color: _appTheme.mainText,
            size: 30
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),

        // Title and statistics
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pick up laundry and donuts',
                softWrap: true,
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              SizedBox( height: 4.0),
              Text(
                "Expires May 7th | People Required: 3/7",
                style: TextStyle(color: _appTheme.secondaryColor),
              )
            ],
          ),
        ),

        //Status indicator
        StatusIndicator(status: "open"),
        SizedBox(width: 8.0)
      ],
    );
  }

  /// The description and the map preview with the address.
  Widget _midRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'I left my laundry in Shipley Donuts one night, and the manager lady said she'd hold onto it for me, but I don't have any clothes to wear, so I can't leave the house out of fear of public indecency. Help a girl out.',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: _appTheme.mainText,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  
  /// The requestor's name and profile picture, and a label for the section.
  Widget _requestorInformation() {
    return InformationSection(
      title: 'Requester',
      child: Row(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: _appTheme.secondaryColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
          Text(
            'LaQuisha Johnson',
            style: TextStyle(
              color: _appTheme.mainText,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  /// The skills required for the request in a tags list, and a label for the section.
  Widget _skillsRequired() {
    return InformationSection(
      title: 'Skills required',
      child: TagPicker(
        initTags: ["CPR certified", "dog friendly"],
        removable: false,
        textFieldEnabled: false
      ),
      placeholderText: 'No skills or certifications required!',
    );
  }

  /// Any images uploaded for the request.
  /// 
  /// This section should not render if the requester does not upload any images.
  /// This uses the InformationSection widget, but the placeholder text should never
  /// be used, since the section will not exist if a child is not provided.
  Widget _images() {
    return InformationSection(
      title: 'Additional',
      placeholderText: 'Not here',
    );
  }

  /// Any updates posted for the bulletin wil be displayed here, each with a time and text.
  Widget _updates() {
    return InformationSection(
      title: 'Updates',
      placeholderText: 'There have not been any updates for this bulletin!',
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '9:27 AM',
                style: TextStyle(color: _appTheme.mainColor),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Text('The laundry smells more like donuts by the minute.'),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Text(
                'May 5th',
                style: TextStyle(
                  color: _appTheme.mainColor,
                ),
              ),
              SizedBox( width: 8.0),
              Expanded(
                child: Text('The manager lady just informed me that she spilled coffee on my underpants.'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// The accept request button and a "not interested" text.
  Widget _actionButtons() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SubmitButton(
            onTap: null,
            text: "ACCEPT"
          ),
          SizedBox(height: 4.0),
          GestureDetector(
            onTap: null,
            child: Text(
              'not interested',
              style: TextStyle(
                color: _appTheme.mainText,
                fontSize: 13
              )
            )
          )
        ],
      ),
    );
  }
}

/// A layout widget used to maintian consistency in the sections of this page.
class InformationSection extends StatelessWidget {
  final String title;
  final String placeholderText;
  final Widget child;
  final double titleSize;

  static ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  const InformationSection({
    Key key,

    /// The title of the section.
    @required this.title,

    /// The text to display if a child is not provided.
    this.placeholderText,

    /// The content of the section.
    this.child,

    /// The size of the section title.
    this.titleSize = 12

  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return child != null ? _childProvided() : _notProvided();
  }

  Widget _childProvided() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: titleSize,
              color: _appTheme.secondaryColor
            ),
          ),
          SizedBox(height: 4.0),
          child,
        ],
      ),
    );
  }

  Widget _notProvided() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: titleSize,
              color: _appTheme.secondaryColor
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              placeholderText,
              style: TextStyle(
                fontSize: titleSize + 2,
                color: _appTheme.mainText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
