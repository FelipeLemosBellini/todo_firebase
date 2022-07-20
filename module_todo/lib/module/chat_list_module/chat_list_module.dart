
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_todo/pages/chat_list_page/chat_list_page.dart';
import 'package:module_todo/stores/chat_list_store/chat_list_store.dart';

final chatDi = <Bind>[Bind.factory((i) => TodoListStore())];

final List<ModularRoute> chatRoute = [
  ChildRoute(WhatsAppMeetupRoutes.chatPage, child: (context, args) => const TodoListPage())
];
