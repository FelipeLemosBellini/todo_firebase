import 'package:module_auth/module/forgot_password/forgot_password_module.dart';
import 'package:module_auth/module/login/login_module.dart';
import 'package:module_auth/module/signup/signup_module.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_auth/module/splash_screen/splash_screen_module.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [...splashScreenDI, ...loginPageDI, ...signUpPageDI, ...forgotPasswordPageDI];

  @override
  List<ModularRoute> get routes =>
      [...splashScreenRoute, ...loginPageRoute, ...signUpPageRoute, ...forgotPasswordPageRoute];
}
