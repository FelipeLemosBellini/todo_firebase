import 'package:flutter/material.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';

class ToDoMeetupInputText extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool hasFocus;
  final String? hintText;
  final bool? obscureText;

  const ToDoMeetupInputText(
      {required this.controller,
      this.hintText,
      this.obscureText,
      this.maxLines,
      this.textInputType,
      this.focusNode,
      this.hasFocus = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: ToDoMeetupDimens.sixteen),
        child: TextField(
            focusNode: focusNode,
            obscureText: obscureText ?? false,
            controller: controller,
            cursorColor: ToDoMeetupColors.gray,
            keyboardType: textInputType ?? TextInputType.text,
            textAlign: TextAlign.left,
            maxLines: maxLines ?? 1,
            expands: false,
            style: const TextStyle(color: ToDoMeetupColors.gray),
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(ToDoMeetupDimens.thirty)),
                hintStyle: const TextStyle(color: ToDoMeetupColors.gray),
                border: InputBorder.none,
                hintText: hintText)));
  }
}
