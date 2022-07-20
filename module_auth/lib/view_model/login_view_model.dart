import 'package:flutter/material.dart';
import 'package:module_commons/helpers/rive_helper.dart';
import 'package:rive/rive.dart';

class LoginViewModel {
  var user;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  late RiveAnimationController riveAnimationLookUpController;
  late RiveAnimationController riveAnimationSlowDanceController;
  List<String> riveAnimations = [RiveBirdAnimation.idle.name];
}
