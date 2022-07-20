import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:module_auth/view_model/signup_view_model.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/widgets/dialog_widget.dart';
import 'package:module_core/models/auth/sign_up/sign_up_request_model.dart';
import 'package:module_core/repository/auth/interface/auth_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:module_core/models/auth/sign_up/sign_up_request_model.dart';
import 'package:module_core/repository/auth/interface/auth_interface.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_external_dependencies/rive.dart';

class SignUpStore extends MobXStore<FirebaseAuthException, SignUpViewModel> {
  final IAuthRepository authRepository;

  SignUpStore({required this.authRepository}) : super(SignUpViewModel());

  @override
  void initStore() {
    _initRiveAnimationController();
    _addFocusListener();
    super.initStore();
  }

  void createAccount(BuildContext context) async {
    _setLookUpAnimation();
    _signUp(context);
  }

  void _signUp(BuildContext context) async {
    var _signUpRequestModel = _createSignUpRequestModel();
    var _response = await authRepository.signUp(_signUpRequestModel);
    _response.fold((error) => _onError(context: context, error: error), (success) => _signUpSuccess());
  }

  void _setLookUpAnimation() {
    state.riveAnimationLookUpController.isActive = true;
    execute(() async => state);
  }

  SignUpRequestModel _createSignUpRequestModel() {
    return SignUpRequestModel(password: state.passwordController.text.trim(), email: state.emailController.text);
  }

  void _signUpSuccess() => Modular.to.pop();

  void _initRiveAnimationController() {
    state.riveAnimationLookUpController = OneShotAnimation(RiveBirdAnimation.lookUp.name, autoplay: false);
    state.riveAnimationSlowDanceController = SimpleAnimation(RiveBirdAnimation.slowDance.name, autoplay: false);
  }

  void _addFocusListener() {
    state.emailFocus.addListener(() => _setActiveRiveController());
    state.passwordFocus.addListener(() => _setActiveRiveController());
    state.usernameFocus.addListener(() => _setActiveRiveController());
  }

  void _setActiveRiveController() {
    var _riveAnimationSlowDance =
        state.emailFocus.hasFocus || state.passwordFocus.hasFocus || state.usernameFocus.hasFocus;
    state.riveAnimationSlowDanceController.isActive = _riveAnimationSlowDance;
    execute(() async => state);
  }

  List<RiveAnimationController> getRiveControllers() {
    return [state.riveAnimationLookUpController, state.riveAnimationSlowDanceController];
  }

  void _onError({required BuildContext context, required FirebaseAuthException error}) {
    WhatsAppMeetupDialogWidget.dialog(context: context, message: error.message, confirmButtonOnTap: Modular.to.pop);
  }

  void goToLoginPage() async => Modular.to.pop();
}
