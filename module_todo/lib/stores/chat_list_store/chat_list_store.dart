
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:module_todo/view_model/chat_list_view_model/chat_list_view_model.dart';

class TodoListStore extends MobXStore<FirebaseAuthException, TodoListViewModel> {
  TodoListStore() : super(TodoListViewModel());

  @override
  void initStore() {
    super.initStore();
  }

  Future<void> deleteTodo(documentSnapshot) async {
    await FirebaseFirestore.instance.collection('user').doc(documentSnapshot.id).delete();
  }

  Future<void> markAsDone(status) async {
    final documentReference = FirebaseFirestore.instance.collection('user').doc(status.id );
    Map<String, dynamic> newTodo = ({
      'isFinished': true,
    });
    await documentReference.update(newTodo);
  }

  void goToNewTodoPage() {
    Modular.to.pushNamed(WhatsAppMeetupRoutes.newTodoPage);
  }
}
