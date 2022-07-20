import 'package:flutter/material.dart';

class WhatsAppMeetupGestureDetector extends StatelessWidget {
  final Widget child;
  final Function() onTap;

  const WhatsAppMeetupGestureDetector({required this.child, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: child);
  }
}
