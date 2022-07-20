import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:module_auth/store/login/login_store.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';
import 'package:module_commons/helpers/whatsapp_meetup_strings.dart';
import 'package:module_commons/widgets/button_widget.dart';
import 'package:module_commons/widgets/gesture_detector_widget.dart';
import 'package:module_commons/widgets/ink_well_widget.dart';
import 'package:module_commons/widgets/input_text_widget.dart';
import 'package:module_commons/widgets/rive_widget.dart';
import 'package:module_commons/widgets/text_field_container_widget.dart';
import 'package:module_commons/widgets/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore _store = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
        store: _store,
        onState: (context, triple) => Scaffold(
            backgroundColor: ToDoMeetupColors.white,
            appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: const Text(ToDoMeetupStrings.bemVindo,
                    style: TextStyle(color: ToDoMeetupColors.white, fontWeight: FontWeight.bold)),
                backgroundColor: ToDoMeetupColors.lightBlue),
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ToDoMeetupInkWellWidget(
                    onTap: FocusScope.of(context).unfocus,
                    child: Padding(
                        padding: const EdgeInsets.all(ToDoMeetupDimens.thirty),
                        child: Column(children: [
                          ToDoAnimationRiveWidget(
                              animationRiveUrl: RiveUrl.bird,
                              riveControllers: _store.getRiveControllers(),
                              riveAnimations: _store.state.riveAnimations,
                              height: ToDoMeetupDimens.threeHundred),
                          const ToDoMeetupTextWidget(
                              paddingLeft: ToDoMeetupDimens.sixteen,
                              text: ToDoMeetupStrings.email,
                              color: ToDoMeetupColors.lightBlue,
                              alignment: Alignment.bottomLeft,
                              paddingTop: ToDoMeetupDimens.twelve),
                          Padding(
                              padding: const EdgeInsets.only(top: ToDoMeetupDimens.twelve),
                              child: ToDoMeetupTextFieldContainerWidget(
                                  hasFocus: _store.state.emailFocus.hasFocus,
                                  child: ToDoMeetupInputText(
                                      focusNode: _store.state.emailFocus,
                                      controller: _store.state.emailController,
                                      maxLines: 1,
                                      hintText: ToDoMeetupStrings.digiteSeuEmail,
                                      hasFocus: _store.state.emailFocus.hasFocus,
                                      textInputType: TextInputType.emailAddress))),
                          const ToDoMeetupTextWidget(
                              text: ToDoMeetupStrings.senha,
                              color: ToDoMeetupColors.lightBlue,
                              alignment: Alignment.centerLeft,
                              paddingLeft: ToDoMeetupDimens.sixteen,
                              paddingTop: ToDoMeetupDimens.twelve),
                          Padding(
                              padding: const EdgeInsets.only(top: ToDoMeetupDimens.twelve),
                              child: ToDoMeetupTextFieldContainerWidget(
                                  child: ToDoMeetupInputText(
                                      controller: _store.state.passwordController,
                                      focusNode: _store.state.passwordFocus,
                                      maxLines: 1,
                                      obscureText: true,
                                      hintText: ToDoMeetupStrings.digiteSuaSenha,
                                      hasFocus: _store.state.passwordFocus.hasFocus,
                                      textInputType: TextInputType.visiblePassword))),
                          Container(
                              padding: const EdgeInsets.only(top: ToDoMeetupDimens.thirty),
                              alignment: Alignment.center,
                              child: WhatsAppMeetupGestureDetector(
                                  onTap: _store.goToForgotPasswordPage,
                                  child: const Text(ToDoMeetupStrings.esqueceuSenha,
                                      style: TextStyle(
                                          color: ToDoMeetupColors.lightBlue, fontWeight: FontWeight.w400)))),
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                  top: ToDoMeetupDimens.twentyFour, bottom: ToDoMeetupDimens.sixty),
                              child: WhatsAppMeetupGestureDetector(
                                  onTap: _store.goToCreateAccount,
                                  child: Center(
                                      child: RichText(
                                          text: const TextSpan(
                                              text: ToDoMeetupStrings.eNovoPorAqui,
                                              style: TextStyle(
                                                  color: ToDoMeetupColors.gray, fontWeight: FontWeight.w400),
                                              children: <TextSpan>[
                                        TextSpan(
                                            text: ToDoMeetupStrings.criarConta,
                                            style: TextStyle(
                                                color: ToDoMeetupColors.lightBlue, fontWeight: FontWeight.w400))
                                      ])))))
                        ])))),
            bottomSheet: ToDoMeetupButtonWidget(
                colorBackground: ToDoMeetupColors.white,
                onTap: () => _store.signIn(context),
                paddingHorizontal: ToDoMeetupDimens.twentyFour,
                paddingVertical: ToDoMeetupDimens.eight,
                text: ToDoMeetupStrings.login,
                width: MediaQuery.of(context).size.width)));
  }
}
