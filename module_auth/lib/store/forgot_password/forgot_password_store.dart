import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:module_auth/view_model/forgot_password_view_model.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/widgets/dialog_widget.dart';
import 'package:module_core/models/auth/forgot_password/forgot_password_request_model.dart';
import 'package:module_core/repository/auth/interface/auth_interface.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:rive/rive.dart';

class ForgotPasswordStore extends MobXStore<FirebaseAuthException, ForgotPasswordViewModel> {
  final IAuthRepository authRepository;

  ForgotPasswordStore({required this.authRepository}) : super(ForgotPasswordViewModel());

  @override
  void initStore() {
    _initRiveAnimationController();
    _addFocusListener();
    super.initStore();
  }

  void _addFocusListener() {
    state.emailFocus.addListener(() => _setActiveRiveController());
  }

  void _setActiveRiveController() {
    var _riveAnimationSlowDance = state.emailFocus.hasFocus;
    state.riveAnimationSlowDanceController.isActive = _riveAnimationSlowDance;
    execute(() async => state);
  }

  void sendEmailForChangePassword(BuildContext context) async {
    _setLookUpAnimation();
    _sendEmailForChangePasswordRequest(context);
  }

  void _sendEmailForChangePasswordRequest(BuildContext context) async {
    var _forgotPasswordRequestModel = _getForgotPasswordRequest();
    var _response = await authRepository.forgotPasswordRequestModel(_forgotPasswordRequestModel);
    _response.fold((error) => _onError(context: context, error: error), (success) => _confirmSendEmail(context));
  }

  void _setLookUpAnimation() {
    state.riveAnimationLookUpController.isActive = true;
    execute(() async => state);
  }

  ForgotPasswordRequestModel _getForgotPasswordRequest() {
    return ForgotPasswordRequestModel(email: state.emailController.text.trim());
  }

  goToLoginPage() => Modular.to.pop();

  void _onError({required BuildContext context, required FirebaseAuthException error}) {
    WhatsAppMeetupDialogWidget.dialog(context: context, message: error.message, confirmButtonOnTap: Modular.to.pop);
  }

  void _confirmSendEmail(BuildContext context) {
    WhatsAppMeetupDialogWidget.dialog(
        context: context, message: "Email to change password has been sent", confirmButtonOnTap: _popToLoginPage);
  }

  void _initRiveAnimationController() {
    state.riveAnimationLookUpController = OneShotAnimation(RiveBirdAnimation.lookUp.name, autoplay: false);
    state.riveAnimationSlowDanceController = SimpleAnimation(RiveBirdAnimation.slowDance.name, autoplay: false);
  }

  List<RiveAnimationController> getRiveControllers() {
    return [state.riveAnimationLookUpController, state.riveAnimationSlowDanceController];
  }

  void _popToLoginPage() {
    Modular.to.pop();
    Modular.to.pop();
  }
}
