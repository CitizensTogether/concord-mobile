import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double width;

  const InputField({
    Key key,
    this.text = "",
    this.width = 200,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: text,
      style: TextStyle(
        color: textColor,
      ),
      decoration: new InputDecoration(
        fillColor: backgroundColor,
        filled: true,
        contentPadding: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
