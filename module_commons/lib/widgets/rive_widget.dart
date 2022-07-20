import 'package:flutter/material.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_external_dependencies/rive.dart';
import 'package:rive/rive.dart';

class ToDoAnimationRiveWidget extends StatelessWidget {
  final String animationRiveUrl;
  final List<RiveAnimationController> riveControllers;
  final double? height;
  final double? width;
  final List<String> riveAnimations;

  const ToDoAnimationRiveWidget(
      {required this.animationRiveUrl,
      this.height,
      this.width,
      required this.riveControllers,
      required this.riveAnimations,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: RiveAnimation.network(animationRiveUrl,
            fit: BoxFit.fitHeight,
            controllers: riveControllers,
            animations: riveAnimations,
            placeHolder: const Center(child: CircularProgressIndicator(color: ToDoMeetupColors.lightBlue))));
  }
}
