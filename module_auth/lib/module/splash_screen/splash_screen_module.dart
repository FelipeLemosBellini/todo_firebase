import 'package:module_auth/pages/splash_screen/splash_screen_page.dart';
import 'package:module_auth/store/splash_screen_store/splash_screen_store.dart';
import 'package:module_commons/commons_dependencies.dart';

final splashScreenDI = <Bind>[Bind.factory((i) => SplashScreenStore())];

final List<ModularRoute> splashScreenRoute = [
  ChildRoute(WhatsAppMeetupRoutes.splashScreen,
      child: (context, args) => SplashScreenPage(), transition: TransitionType.rightToLeft)
];
