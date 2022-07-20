
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:module_todo/view_model/new_todo_view_model/new_todo_view_model.dart';

class NewTodoStore extends MobXStore<FirebaseAuthException, NewTodoViewModel> {
  NewTodoStore() : super(NewTodoViewModel());

  @override
  void initStore() {
    super.initStore();
  }

  Future<void> addTodo() async {
    if (state.todoController.text.isNotEmpty) {
      final documentReference = FirebaseFirestore.instance.collection('user').doc();
      Map<String, dynamic> newTodo = ({
        'todo': state.todoController.text,
        'isFinished': false,
      });
      await documentReference.set(newTodo);
      goToCreateNewTodoPage();
    }
  }

  void goToCreateNewTodoPage() {
    Modular.to.pushNamed(WhatsAppMeetupRoutes.homeChatPage);
  }
}
