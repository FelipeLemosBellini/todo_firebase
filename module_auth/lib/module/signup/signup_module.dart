import 'package:module_auth/pages/signup_page/signup_page.dart';
import 'package:module_auth/store/signup_store/signup_store.dart';
import 'package:module_commons/commons_dependencies.dart';

final signUpPageDI = <Bind>[Bind.factory((i) => SignUpStore(authRepository: i.get()))];

final List<ModularRoute> signUpPageRoute = [
  ChildRoute(WhatsAppMeetupRoutes.signUpPage,
      child: (context, args) => const SignUpPage(), transition: TransitionType.rightToLeft)
];
