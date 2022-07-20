import 'package:flutter/material.dart';
import 'package:module_commons/commons_dependencies.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(WhatsAppMeetupRoutes.loginPage);

    return MaterialApp.router(
        routerDelegate: Modular.routerDelegate,
        debugShowCheckedModeBanner: false,
        routeInformationParser: Modular.routeInformationParser);
  }
}
