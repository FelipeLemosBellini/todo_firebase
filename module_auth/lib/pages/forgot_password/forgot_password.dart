import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:module_auth/store/forgot_password/forgot_password_store.dart';
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

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final ForgotPasswordStore _store = Modular.get<ForgotPasswordStore>();

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
        store: _store,
        onState: (context, triple) => Scaffold(
            backgroundColor: ToDoMeetupColors.white,
            appBar: AppBar(
                centerTitle: true,
                title: const Text(ToDoMeetupStrings.trocarSenha,
                    style: TextStyle(color: ToDoMeetupColors.white, fontWeight: FontWeight.bold))),
            body: ToDoMeetupInkWellWidget(
                onTap: FocusScope.of(context).unfocus,
                child: ListView(
                    padding: const EdgeInsets.only(
                        left: ToDoMeetupDimens.twentyFour,
                        top: ToDoMeetupDimens.twentyFour,
                        right: ToDoMeetupDimens.twentyFour,
                        bottom: ToDoMeetupDimens.sixty),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ToDoAnimationRiveWidget(
                          animationRiveUrl: RiveUrl.bird,
                          riveControllers: _store.getRiveControllers(),
                          riveAnimations: _store.state.riveAnimations,
                          height: ToDoMeetupDimens.threeHundred),
                      const ToDoMeetupTextWidget(
                          text: ToDoMeetupStrings.digiteSeuEmail,
                          color: ToDoMeetupColors.lightBlue,
                          alignment: Alignment.centerLeft,
                          paddingTop: ToDoMeetupDimens.forty),
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
                                  textInputType: TextInputType.name)))
                    ])),
            bottomSheet: ToDoMeetupButtonWidget(
                colorBackground: ToDoMeetupColors.transparent,
                onTap: () => _store.sendEmailForChangePassword(context),
                paddingHorizontal: ToDoMeetupDimens.twentyFour,
                paddingVertical: ToDoMeetupDimens.eight,
                text: ToDoMeetupStrings.enviarEmail,
                width: MediaQuery.of(context).size.width)));
  }
}
