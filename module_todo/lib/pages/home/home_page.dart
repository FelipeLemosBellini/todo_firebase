import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/helpers/whatsapp_meetup_colors.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';
import 'package:module_commons/helpers/whatsapp_meetup_opacity.dart';
import 'package:module_commons/helpers/whatsapp_meetup_strings.dart';
import 'package:module_todo/pages/chat_list_page/chat_list_page.dart';
import 'package:module_todo/stores/home_store/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore _store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
        store: _store,
        onState: (context, triple) => Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    color: ToDoMeetupColors.white,
                    onPressed: () => _store.signOut()),
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: ToDoMeetupColors.lightBlue,
                toolbarHeight: ToDoMeetupDimens.fifty,
                title: const Text(ToDoMeetupStrings.whatsAppMeetUpFlutter,
                    style: TextStyle(
                        color: ToDoMeetupColors.white,
                        fontSize: ToDoMeetupDimens.sixteen,
                        fontWeight: FontWeight.w800))),
            body: PageView(children: const [TodoListPage()])));
  }
}
