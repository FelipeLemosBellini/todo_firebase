import 'package:flutter/material.dart';
import 'package:module_commons/commons_dependencies.dart';
import 'package:module_commons/helpers/whatsapp_meetup_dimens.dart';

class HomeViewModel {
  List<Widget> bottomMenuItems = const [
    Icon(Icons.add, size: ToDoMeetupDimens.thirty),
    Icon(Icons.list, size: ToDoMeetupDimens.thirty),
    Icon(Icons.compare_arrows, size: ToDoMeetupDimens.thirty)
  ];
}
