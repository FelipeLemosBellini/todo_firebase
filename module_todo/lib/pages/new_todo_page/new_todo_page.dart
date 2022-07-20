import 'package:flutter/material.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:module_commons/helpers/whatsapp_meetup_strings.dart';
import 'package:module_commons/widgets/button_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_commons/widgets/text_widget.dart';
import 'package:module_commons/widgets/text_field_container_widget.dart';
import 'package:module_commons/widgets/input_text_widget.dart';
import 'package:module_todo/stores/new_todo_store/new_todo_store.dart';

class NewTodoPage extends StatefulWidget {
  const NewTodoPage({Key? key}) : super(key: key);

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final NewTodoStore _store = Modular.get<NewTodoStore>();

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
        store: _store,
        onState: (context, triple) => Scaffold(
          appBar: AppBar(backgroundColor: ToDoMeetupColors.lightBlue,title: const Text(ToDoMeetupStrings.crieSuaTarefa)),
            body: Padding(
                padding: const EdgeInsets.only(top: ToDoMeetupDimens.sixty, right: ToDoMeetupDimens.thirty),
                child: Center(
                    child: Column(children: [
                  const Padding(
                      padding: EdgeInsets.only(left: ToDoMeetupDimens.fifty),
                      child: ToDoMeetupTextWidget(
                          text: ToDoMeetupStrings.tarefa,
                          color: ToDoMeetupColors.lightBlue,
                          alignment: Alignment.centerLeft,
                          paddingRight: ToDoMeetupDimens.twentyFour,
                          paddingTop: ToDoMeetupDimens.twelve)),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: ToDoMeetupDimens.twelve, left: ToDoMeetupDimens.twentyFour),
                      child: ToDoMeetupTextFieldContainerWidget(
                          child: ToDoMeetupInputText(
                              controller: _store.state.todoController,
                              focusNode: _store.state.todoFocus,
                              maxLines: 1,
                              hintText: ToDoMeetupStrings.digiteSuaTarefa,
                              hasFocus: _store.state.todoFocus.hasFocus,
                              textInputType: TextInputType.visiblePassword)))
                ]))),
            bottomSheet: ToDoMeetupButtonWidget(
                colorBackground: ToDoMeetupColors.white,
                onTap: () => _store.addTodo(),
                paddingHorizontal: ToDoMeetupDimens.twentyFour,
                paddingVertical: ToDoMeetupDimens.eight,
                text: ToDoMeetupStrings.criar,
                width: MediaQuery.of(context).size.width)));
  }
}
