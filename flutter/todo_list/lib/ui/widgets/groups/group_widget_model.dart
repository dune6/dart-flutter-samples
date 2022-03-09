import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/entities/group.dart';
import 'package:todo_list/domain/entities/task.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  GroupsWidgetModel() {
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRoutes.groupsForm);
  }

  void showTasks(BuildContext context, int indexGroup) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final groupKey = box.keyAt(indexGroup) as int;

    unawaited(
        Navigator.of(context).pushNamed(MainNavigationRoutes.tasks, arguments: groupKey));
  }

  void _readGroupsFromHive(Box<Group> box) {
    _groups = box.values.toList();
    notifyListeners();
  }

  void deleteGroup(int index) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(GroupAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    Hive.openBox<Task>('tasks_box');
    final box = await Hive.openBox<Group>('groups_box');
    await box.getAt(index)?.tasks?.deleteAllFromHive();
    
    await box.deleteAt(index);
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    _readGroupsFromHive(box);

    box.listenable().addListener(() => _readGroupsFromHive(box));
  }
}

class GroupsWidgetModelProvider extends InheritedNotifier {
  final GroupsWidgetModel model;

  const GroupsWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child, notifier: model);

  static GroupsWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsWidgetModelProvider>();
  }

  static GroupsWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupsWidgetModelProvider>()
        ?.widget;
    return widget is GroupsWidgetModelProvider ? widget : null;
  }
}
