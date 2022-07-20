import 'package:module_commons/commons_dependencies.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:module_todo/view_model/home_view_model/home_view_model.dart';

class HomeStore extends MobXStore<FirebaseAuthException, HomeViewModel> {
  HomeStore() : super(HomeViewModel());

  @override
  void initStore() {
    super.initStore();
  }

  void signOut() async {
    var user = FirebaseAuth.instance;
    await user.signOut();
    print("Meu email: ${user.currentUser?.email}");
    Modular.to.popAndPushNamed(WhatsAppMeetupRoutes.loginPage);
  }
}
