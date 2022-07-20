
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_todo/module/home/home_module.dart';
import 'package:module_todo/module/new_todo_module/new_todo_module.dart';

import 'chat_list_module/chat_list_module.dart';

class TodoModule extends Module {
  @override
  List<Bind> get binds => [...homeChatDi, ...chatDi, ...newTodoDi];

  @override
  List<ModularRoute> get routes => [...homeChatRoute, ...chatRoute, ...newTodoRoute];
}
