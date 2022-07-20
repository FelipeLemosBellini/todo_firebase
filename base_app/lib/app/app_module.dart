import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_auth/module/auth_module.dart';
import 'package:module_auth/module/splash_screen/splash_screen_module.dart';
import 'package:module_todo/module/module_chat.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [...splashScreenDI];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: AuthModule()),
        ModuleRoute(Modular.initialRoute, module: TodoModule())
      ];
}
