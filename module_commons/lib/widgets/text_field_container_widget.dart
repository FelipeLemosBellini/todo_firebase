import 'package:flutter/material.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';

class ToDoMeetupTextFieldContainerWidget extends StatelessWidget {
  final Widget? child;
  final bool hasFocus;

  const ToDoMeetupTextFieldContainerWidget({required this.child, this.hasFocus = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * ToDoMeetupDimens.zeroDotEight,
        child: child!,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(ToDoMeetupDimens.thirty),
                topRight: Radius.circular(ToDoMeetupDimens.thirty),
                bottomRight: Radius.circular(ToDoMeetupDimens.thirty),
                topLeft: Radius.circular(ToDoMeetupDimens.thirty)),
            color: ToDoMeetupColors.graylight,
            border: Border.all(color: ToDoMeetupColors.grayDark, width: ToDoMeetupDimens.zeroDotEight)));
  }
}
