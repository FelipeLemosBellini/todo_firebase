import 'package:flutter/material.dart';
import 'package:module_auth/store/splash_screen_store/splash_screen_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:flutter_triple/flutter_triple.dart';
class SplashScreenPage extends StatefulWidget {

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final SplashScreenStore store = Modular.get<SplashScreenStore>();

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
        store: store,
        onState: (context, triple) => const Scaffold(
            backgroundColor: ToDoMeetupColors.lightBlue,
            body: Center(child: Text("data")
                // SizedBox(
                //     height: 100,
                //     width: 100,
                // child:
                // RiveAnimation.asset(
                //   //rives.flag.riv
                //   'rives/flag.riv',
                // )
                // )
                )));
  }
}
