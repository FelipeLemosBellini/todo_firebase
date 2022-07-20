import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:module_auth/view_model/splash_screen.dart';
import 'package:module_commons/helpers/whatsapp_meetup_routes.dart';

class SplashScreenStore extends MobXStore<FirebaseAuthException, SplashScreenViewModel> {
  SplashScreenStore() : super(SplashScreenViewModel());

  @override
  void initStore() async {
    execute(() async => state);
    goToHomePage();
  }

  goToHomePage() => Modular.to.popAndPushNamed(WhatsAppMeetupRoutes.loginPage);
}
