import 'package:flutter/material.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';
import 'package:module_commons/widgets/ink_well_widget.dart';

class ToDoMeetupButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double width;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Color? colorBackground;

  const ToDoMeetupButtonWidget(
      {required this.onTap,
      required this.text,
      required this.width,
      this.paddingHorizontal,
      this.paddingVertical,
      this.colorBackground,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToDoMeetupInkWellWidget(
        onTap: onTap,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 0, vertical: paddingVertical ?? 0),
            child: Container(
                height: ToDoMeetupDimens.forty,
                width: width,
                child: Center(
                    child: Text(text,
                        style: const TextStyle(color: ToDoMeetupColors.white, fontWeight: FontWeight.bold))),
                decoration: const BoxDecoration(
                    color: ToDoMeetupColors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(ToDoMeetupDimens.thirty))))));
  }
}
