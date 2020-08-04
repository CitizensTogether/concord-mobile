import 'package:concord/ui/theme/theme.dart';
import 'package:concord/ui/widgets/status_indicator.dart';
import 'package:concord/ui/widgets/tags.dart';
import 'package:concord/utils/locator.dart';
import 'package:flutter/material.dart';

/// A card to hold the details for a request.
/// 
/// Inteded to be used in the bottom sheet of the home screen.
class RequestDetailsCard extends StatelessWidget {

  final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  Widget build(BuildContext context) {
    return Card(
       color: _appTheme.antiOpposite,
       elevation: 4.0,
       borderOnForeground: false,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8.0),
       ),
       margin: EdgeInsets.all(16.0),
       child: Container(
        //  height: MediaQuery.of(context).size.height*0.8,
        //  width: MediaQuery.of(context).size.width*1,
         padding: EdgeInsets.symmetric(vertical: 16.0),
         child: SingleChildScrollView(
            child: Column(
             children: <Widget>[
               _requestMetaData(),
               RequestData(),
             ],
           ),
         ),
       )
    );
  }
  
  /// This is the header row of the card. 
  /// 
  /// Contains the request's status indicator, title, expiration, and the helpers
  /// required. There is also a chat icon to allow the user to go to the chat room
  /// for this request and a more option. 
  Widget _requestMetaData(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          StatusIndicator(
            status: 'Open',
            width: 35.0,
            textColor: _appTheme.mainColor,
          ),
          SizedBox(width: 16.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cat stuck in tree',
                  style: _appTheme.textTheme.headline6.copyWith(
                    color: _appTheme.mainText, 
                  ),
                ),
                Text(
                  'Expires May 7 | People Required: 3/7',
                  style: _appTheme.textTheme.overline.copyWith(
                    color: _appTheme.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Icon(
              Icons.chat,
              color: _appTheme.opposite.withOpacity(0.4),
              size: 28,
            ),
          ),
          SizedBox(width: 4.0,),
          GestureDetector(
            onTap: (){},
            child: Icon(
              Icons.more_vert,
              color: _appTheme.opposite.withOpacity(0.4),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

}

/// The deatils about any bulletin.
/// 
/// This includes the notes, the requester/helper name, the skills required for
/// the task, any additional media uploaded by the requester, and any updates posted
/// for the bulletin.  
class RequestData extends StatelessWidget {

  static ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _midRow(),
          _requesterInformation(),
          _skillsRequired(),
          _images(),
          _updates(),
        ],
      ),
    );
  }

    /// The description and the map preview with the address.
  Widget _midRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'I left my laundry in Shipley Donuts one night, and the manager lady said she\'d hold onto it for me, but I don\'t have any clothes to wear, so I can\'t leave the house out of fear of public indecency. Help a girl out.',
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
  Widget _requesterInformation() {
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
      padding: EdgeInsets.all(8.0),
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
