import 'package:flutter/material.dart';

class ToDoMeetupTextWidget extends StatelessWidget {
  final String text;
  final Alignment? alignment;
  final Color color;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;

  const ToDoMeetupTextWidget(
      {required this.text,
      required this.color,
      this.alignment,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.paddingLeft = 0,
      this.paddingRight = 0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: paddingTop ?? 0, bottom: paddingBottom ?? 0, left: paddingLeft ?? 0, right: paddingRight ?? 0),
        alignment: alignment,
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: color)));
  }
}
