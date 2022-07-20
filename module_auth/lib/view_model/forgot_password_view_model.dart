import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_commons/helpers/rive_helper.dart';
import 'package:rive/rive.dart';

class ForgotPasswordViewModel {
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  late RiveAnimationController riveAnimationLookUpController;
  late RiveAnimationController riveAnimationSlowDanceController;
  List<String> riveAnimations = [RiveBirdAnimation.idle.name];
}
