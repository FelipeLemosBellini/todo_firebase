import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:module_auth/view_model/login_view_model.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/widgets/dialog_widget.dart';
import 'package:module_core/models/auth/sign_in/sign_in_request_model.dart';
import 'package:module_core/repository/auth/interface/auth_interface.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_external_dependencies/rive.dart';

class LoginStore extends MobXStore<FirebaseAuthException, LoginViewModel> {
  final IAuthRepository authRepository;

  LoginStore({required this.authRepository}) : super(LoginViewModel());

  @override
  void initStore() {
    _initRiveAnimationController();
    _addFocusListener();
    super.initStore();
  }

  void _addFocusListener() {
    state.emailFocus.addListener(() => _setActiveRiveController());
    state.passwordFocus.addListener(() => _setActiveRiveController());
  }

  void _setActiveRiveController() {
    var _riveAnimationSlowDance = state.emailFocus.hasFocus || state.passwordFocus.hasFocus;
    state.riveAnimationSlowDanceController.isActive = _riveAnimationSlowDance;
    execute(() async => state);
  }

  void _initRiveAnimationController() {
    state.riveAnimationLookUpController = OneShotAnimation(RiveBirdAnimation.lookUp.name, autoplay: false);
    state.riveAnimationSlowDanceController = SimpleAnimation(RiveBirdAnimation.slowDance.name, autoplay: false);
  }

  List<RiveAnimationController> getRiveControllers() {
    return [state.riveAnimationLookUpController, state.riveAnimationSlowDanceController];
  }

  void _setLookUpAnimation() {
    state.riveAnimationLookUpController.isActive = true;
    execute(() async => state);
  }

  void signIn(BuildContext context) async {
    _setLookUpAnimation();
    _signInRequest(context);
  }

  void _signInRequest(BuildContext context) async {
    var _signInRequestModel = _createSignInRequestModel();
    var _response = await authRepository.signIn(_signInRequestModel);
    _response.fold((error) => _onError(context: context, error: error), (success) => _signInSuccess());
  }

  void _signInSuccess() {
    _goToChatPage();
  }

  SignInRequestModel _createSignInRequestModel() {
    var _signInRequestModel =
        SignInRequestModel(email: state.emailController.text.trim(), password: state.passwordController.text.trim());
    return _signInRequestModel;
  }

  void _goToChatPage() => Modular.to.pushNamed(WhatsAppMeetupRoutes.homeChatPage);

  void goToCreateAccount() => Modular.to.pushNamed(WhatsAppMeetupRoutes.signUpPage);

  void goToForgotPasswordPage() => Modular.to.pushNamed(WhatsAppMeetupRoutes.forgotPasswordPage);

  void _onError({required BuildContext context, required FirebaseAuthException error}) {
    WhatsAppMeetupDialogWidget.dialog(context: context, message: error.message, confirmButtonOnTap: Modular.to.pop);
  }
}
