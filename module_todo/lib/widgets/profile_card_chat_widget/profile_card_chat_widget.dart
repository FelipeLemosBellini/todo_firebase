import 'package:flutter/material.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';
import 'package:module_commons/helpers/whatsapp_meetup_opacity.dart';
import 'package:module_todo/widgets/profile_card_chat_widget/profile_card_chat_model.dart';
import 'package:module_todo/widgets/profile_card_image_widget.dart';

class ProfileCardChatWidget extends StatelessWidget {
  final ProfileCardChatModel profileCardChat;

  const ProfileCardChatWidget({required this.profileCardChat, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: ToDoMeetupDimens.one,
                        color: ToDoMeetupColors.ultraLightBlue.withOpacity(WhatsAppMeetupOpacity.zeroDotFive)))),
            child: ListTile(
                onTap: profileCardChat.onTapProfileCard,
                contentPadding: const EdgeInsets.symmetric(vertical: ToDoMeetupDimens.eight),
                leading: ProfileCardImageWidget(imageUrl: profileCardChat.imageUrl),
                title: Text(profileCardChat.cardTitle,
                    style: const TextStyle(
                        fontSize: ToDoMeetupDimens.sixteen,
                        color: ToDoMeetupColors.highBlue,
                        fontWeight: FontWeight.w500)))));
  }
}
