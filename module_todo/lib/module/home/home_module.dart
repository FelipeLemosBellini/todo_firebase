
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_todo/pages/home/home_page.dart';
import 'package:module_todo/stores/home_store/home_store.dart';

final homeChatDi = <Bind>[Bind.factory((i) => HomeStore())];

final List<ModularRoute> homeChatRoute = [
  ChildRoute(WhatsAppMeetupRoutes.homeChatPage, child: (context, args) => const HomePage())
];
