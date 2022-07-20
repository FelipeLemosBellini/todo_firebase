import 'package:module_auth/pages/forgot_password/forgot_password.dart';
import 'package:module_auth/store/forgot_password/forgot_password_store.dart';
import 'package:module_commons/commons_dependencies.dart';

final forgotPasswordPageDI = <Bind>[Bind.factory((i) => ForgotPasswordStore(authRepository: i.get()))];

final List<ModularRoute> forgotPasswordPageRoute = [
  ChildRoute(WhatsAppMeetupRoutes.forgotPasswordPage,
      child: (context, args) => const ForgotPasswordPage(), transition: TransitionType.rightToLeft)
];
