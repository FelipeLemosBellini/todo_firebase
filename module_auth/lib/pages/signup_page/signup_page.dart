import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:module_auth/store/signup_store/signup_store.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';
import 'package:module_commons/helpers/whatsapp_meetup_strings.dart';
import 'package:module_commons/widgets/button_widget.dart';
import 'package:module_commons/widgets/ink_well_widget.dart';
import 'package:module_commons/widgets/input_text_widget.dart';
import 'package:module_commons/widgets/rive_widget.dart';
import 'package:module_commons/widgets/text_field_container_widget.dart';
import 'package:module_commons/widgets/text_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpStore _store = Modular.get<SignUpStore>();

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
        store: _store,
        onState: (context, triple) => Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: const Text(ToDoMeetupStrings.vamosCriarUmaConta,
                    style: TextStyle(color: ToDoMeetupColors.white, fontWeight: FontWeight.bold))),
            backgroundColor: ToDoMeetupColors.white,
            body: ToDoMeetupInkWellWidget(
                onTap: FocusScope.of(context).unfocus,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: ToDoMeetupDimens.thirty,
                        right: ToDoMeetupDimens.thirty,
                        top: ToDoMeetupDimens.sixty),
                    child: Column(children: [
                      ToDoAnimationRiveWidget(
                          animationRiveUrl: RiveUrl.bird,
                          riveControllers: _store.getRiveControllers(),
                          riveAnimations: _store.state.riveAnimations,
                          height: ToDoMeetupDimens.threeHundred),
                      const ToDoMeetupTextWidget(
                          paddingLeft: ToDoMeetupDimens.twentyFour,
                          text: ToDoMeetupStrings.email,
                          color: ToDoMeetupColors.lightBlue,
                          alignment: Alignment.bottomLeft,
                          paddingTop: ToDoMeetupDimens.twelve),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: ToDoMeetupDimens.twelve, right: ToDoMeetupDimens.twentyFour),
                          child: ToDoMeetupTextFieldContainerWidget(
                              hasFocus: _store.state.emailFocus.hasFocus,
                              child: ToDoMeetupInputText(
                                  focusNode: _store.state.emailFocus,
                                  controller: _store.state.emailController,
                                  maxLines: 1,
                                  obscureText: true,
                                  hintText: ToDoMeetupStrings.digiteSeuEmail,
                                  hasFocus: _store.state.emailFocus.hasFocus,
                                  textInputType: TextInputType.name))),
                      const Padding(
                          padding: EdgeInsets.only(left: ToDoMeetupDimens.twentyFour),
                          child: ToDoMeetupTextWidget(
                              text: ToDoMeetupStrings.senha,
                              color: ToDoMeetupColors.lightBlue,
                              alignment: Alignment.centerLeft,
                              paddingTop: ToDoMeetupDimens.twelve)),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: ToDoMeetupDimens.twelve,
                              bottom: ToDoMeetupDimens.sixty),
                          child: ToDoMeetupTextFieldContainerWidget(
                              child: ToDoMeetupInputText(
                                  controller: _store.state.passwordController,
                                  focusNode: _store.state.passwordFocus,
                                  maxLines: 1,
                                  hintText: ToDoMeetupStrings.digiteSuaSenha,
                                  hasFocus: _store.state.passwordFocus.hasFocus,
                                  textInputType: TextInputType.visiblePassword)))
                    ]))),
            bottomSheet: ToDoMeetupButtonWidget(
                colorBackground: ToDoMeetupColors.white,
                onTap: () => _store.createAccount(context),
                paddingHorizontal: ToDoMeetupDimens.twentyFour,
                paddingVertical: ToDoMeetupDimens.eight,
                text: ToDoMeetupStrings.criarConta,
                width: MediaQuery.of(context).size.width)));
  }
}
