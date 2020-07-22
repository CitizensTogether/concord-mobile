import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

/// A card displaying title, description, and image of a bulletin uploaded by app users.
class CommunityBulletinTile extends StatelessWidget {
  final Asset image;
  final String title;
  final String description;
  final Color titleColor;
  final Color descriptionColor;
  final Function() onTap;

  const CommunityBulletinTile({
    Key key,
    this.image,
    @required this.onTap,
    @required this.title,
    this.description,
    this.titleColor,
    this.descriptionColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 4.0;
    double height = 98;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // If there is an image, the tile will be longer to accommodate the thumbnail image
        width: image != null ? MediaQuery.of(context).size.width-16 :  MediaQuery.of(context).size.width-16-height,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Color(0xffFAFAFA),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,3)
            )
          ]
        ),
        child: image != null ?
          Row(
            children: <Widget>[
              AssetThumb(
                asset: image,
                width: height.floor(),
                height: height.floor(),
              ),
              _textPortion()
            ],
          ) : 
          _textPortion()
      ),
    );
  }

  Padding _textPortion() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
      child: description != null ? 
        //if there's both a title and description
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title(),
            SizedBox( height: 4.0 ),
            Text(
              description,
              style: TextStyle(
                color: descriptionColor ?? Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        )
        //if there is only a title and no description
        : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title()
          ],
        ),
    );
  }

  Text _title() {
    return Text(
      title,
      style: TextStyle(
        color: titleColor ?? Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500
      )
    );
  }
}

/// A card displaying a bulletin organization, and image of a bulletin uploaded by an organization.
class FeaturedBulletinTile extends StatelessWidget {
  final String taskTitle;
  final String organizationName;
  final Asset image;
  final Function() onTap;

  const FeaturedBulletinTile({
    Key key,
    @required this.onTap,
    @required this.taskTitle,
    @required this.organizationName,
    @required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 4.0;
    double height = 220;
    double width = 294;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,3)
            )
          ]
        ),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.7,
              child: AssetThumb(
                asset: image,
                width: width.floor(),
                height: height.floor()
              ),
            ),
            Positioned(
              bottom: 16,
              child: Container(
                color: Colors.white,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      taskTitle,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      organizationName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

/// A card displaying an organization's name and image.
class OrganizationTile extends StatelessWidget {
  final String organizationName;
  final Asset image;
  final Function() onTap;

  const OrganizationTile({
    Key key,
    @required this.onTap,
    @required this.organizationName,
    @required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 4.0;
    double height = 132;
    double width = 218;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,3)
            )
          ]
        ),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.7,
              child: AssetThumb(
                asset: image,
                width: width.floor(),
                height: height.floor()
              ),
            ),
            Positioned(
              bottom: 16,
              child: Container(
                color: Colors.white,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  organizationName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
