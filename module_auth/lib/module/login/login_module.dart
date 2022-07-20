import 'package:module_auth/pages/login_page/login_page.dart';
import 'package:module_auth/store/login/login_store.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_core/repository/auth/auth_repository.dart';

final loginPageDI = <Bind>[
  Bind.lazySingleton((i) => AuthRepository()),
  Bind.factory((i) => LoginStore(authRepository: i.get()))
];

final List<ModularRoute> loginPageRoute = [
  ChildRoute(WhatsAppMeetupRoutes.loginPage,
      child: (context, args) => const LoginPage(), transition: TransitionType.rightToLeft)
];
