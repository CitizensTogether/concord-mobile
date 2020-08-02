import 'package:flutter/material.dart';

/// A badge list

class Badges extends StatelessWidget {
  final List<String> badges;

  Badges({Key key, this.badges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: badges.length,
        itemBuilder: (context, index) {
          return Image.asset(
            'images/badge.png',
          );
        },
      ),
    );
  }
}
