import 'package:flutter/material.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';
import 'package:module_external_dependencies/cached_network_image.dart';

class ProfileCardImageWidget extends StatelessWidget {
  final String imageUrl;

  const ProfileCardImageWidget({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ToDoMeetupDimens.fifty,
      height: ToDoMeetupDimens.fifty,
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(ToDoMeetupDimens.thirty)),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover))),
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(color: ToDoMeetupColors.highBlue, value: downloadProgress.progress)),
          errorWidget: (context, url, error) => const Icon(Icons.error, color: ToDoMeetupColors.highBlue)),
    );
  }
}
