import 'package:flutter/material.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';

abstract class WhatsAppMeetupDialogWidget {
  static Future<Widget> dialog({
    required BuildContext context,
    required String? message,
    required Function()? confirmButtonOnTap,
  }) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: AlertDialog(
                  alignment: Alignment.center,
                  insetPadding: const EdgeInsets.symmetric(horizontal: ToDoMeetupDimens.sixty),
                  title: Text(message ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: ToDoMeetupColors.lightBlue, fontWeight: FontWeight.bold)),
                  content: MaterialButton(
                      color: ToDoMeetupColors.lightBlue,
                      onPressed: confirmButtonOnTap,
                      child: const Text("Voltar", style: TextStyle(fontWeight: FontWeight.bold)))));
        });
  }
}
