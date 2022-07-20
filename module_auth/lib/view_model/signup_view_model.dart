import 'package:flutter/material.dart';
import 'package:module_commons/helpers/rive_helper.dart';
import 'package:rive/rive.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
class SignUpViewModel {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  late RiveAnimationController riveAnimationLookUpController;
  late RiveAnimationController riveAnimationSlowDanceController;
  List<String> riveAnimations = [RiveBirdAnimation.idle.name];

  CollectionReference users = FirebaseFirestore.instance.collection('users');
}
