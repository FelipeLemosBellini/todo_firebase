import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';
import 'package:module_commons/helpers/whatsapp_meetup_strings.dart';
import 'package:module_commons/widgets/ink_well_widget.dart';
import 'package:module_todo/stores/chat_list_store/chat_list_store.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TodoListStore _chatStore = Modular.get<TodoListStore>();

  @override
  Widget build(BuildContext context) {
    final CollectionReference todo = FirebaseFirestore.instance.collection('user');

    return ScopedBuilder(
        store: _chatStore,
        onState: (context, triple) => Scaffold(
            body: Center(
                child: StreamBuilder(
                    stream: todo.orderBy("todo", descending: true).snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        if (streamSnapshot.data!.docs.isNotEmpty) {
                          return ListView.builder(
                              padding: const EdgeInsets.only(top: ToDoMeetupDimens.sixteen),
                              physics: const BouncingScrollPhysics(),
                              itemCount: streamSnapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var documentSnapshot = streamSnapshot.data!.docs[index];
                                return Card(
                                    margin: const EdgeInsets.all(ToDoMeetupDimens.eight),
                                    child: ListTile(
                                        trailing: documentSnapshot['isFinished']
                                            ? ToDoMeetupInkWellWidget(
                                                onTap: () => _chatStore.deleteTodo(documentSnapshot),
                                                child: const Icon(Icons.delete_outlined, color: ToDoMeetupColors.red))
                                            : ToDoMeetupInkWellWidget(
                                                onTap: () => _chatStore.markAsDone(documentSnapshot),
                                                child: const Icon(Icons.check, color: ToDoMeetupColors.green)),
                                        title: Text(documentSnapshot['todo'],
                                            style: documentSnapshot['isFinished']
                                                ? const TextStyle(color: ToDoMeetupColors.gray)
                                                : const TextStyle(color: ToDoMeetupColors.black))));
                              });
                        } else {
                          return const Text(ToDoMeetupStrings.createYourTask,
                              style: TextStyle(color: ToDoMeetupColors.gray));
                        }
                      } else {
                        return const Text(ToDoMeetupStrings.loading, style: TextStyle(color: ToDoMeetupColors.gray));
                      }
                    })),
            floatingActionButton: FloatingActionButton(
                onPressed: () => _chatStore.goToNewTodoPage(),
                child: const Icon(Icons.add, color: ToDoMeetupColors.white),
                backgroundColor: ToDoMeetupColors.lightBlue)));
  }
}
