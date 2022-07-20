
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_todo/pages/new_todo_page/new_todo_page.dart';
import 'package:module_todo/stores/new_todo_store/new_todo_store.dart';

final newTodoDi = <Bind>[Bind.factory((i) => NewTodoStore())];

final List<ModularRoute> newTodoRoute = [
  ChildRoute(WhatsAppMeetupRoutes.newTodoPage,
      child: (context, args) => const NewTodoPage(), transition: TransitionType.rightToLeft)
];
