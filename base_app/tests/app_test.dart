import 'package:base_app/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:module_auth/module/auth_module.dart';
import 'package:module_commons/helpers/whatsapp_meetup_routes.dart';
import 'package:module_external_dependencies/modular_test.dart';
import 'package:module_todo/module/module_chat.dart';

// import 'package:flutter_modular/flutter_modular.dart';
import 'package:base_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    // app.main();
    // Modular.init(AuthModule());
    // Modular.setInitialRoute(WhatsAppMeetupRoutes.loginPage);
  });
  testWidgets("buttonLogin", (WidgetTester test) async {
    app.main();
    await test.tap(find.byKey(const Key("buttonLogin")));
  });
}
