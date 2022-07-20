import 'package:flutter/material.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';

class ToDoMeetupInkWellWidget extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onLongPress;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? highlightColor;
  final Color? splashColor;

  const ToDoMeetupInkWellWidget({
    required this.child,
    this.highlightColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: child,
        onTap: onTap,
        onLongPress: onLongPress,
        splashColor: splashColor ?? ToDoMeetupColors.transparent,
        highlightColor: highlightColor ?? ToDoMeetupColors.transparent,
        focusColor: focusColor ?? ToDoMeetupColors.transparent,
        hoverColor: hoverColor ?? ToDoMeetupColors.transparent);
  }
}
