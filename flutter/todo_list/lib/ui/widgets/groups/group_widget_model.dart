import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entities/group.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';
import 'package:todo_list/ui/widgets/tasks/task_widget.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _groups = <Group>[];

  late final Future<Box<Group>> _box;

  ValueListenable<Object>? _listenable;

  List<Group> get groups => _groups.toList();

  GroupsWidgetModel() {
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRoutes.groupsForm);
  }

  Future<void> showTasks(BuildContext context, int indexGroup) async {
    final group = (await _box).getAt(indexGroup);
    if (group != null) {
      final configuration = TaskWidgetConfiguration(group.key, group.name);
      unawaited(Navigator.of(context)
          .pushNamed(MainNavigationRoutes.tasks, arguments: configuration));
    }
  }

  Future<void> deleteGroup(int index) async {
    final box = await _box;
    final groupKey = (await _box).keyAt(index) as int;
    Hive.deleteBoxFromDisk(BoxManager.instance.makeTaskBoxName(groupKey));
    await box.deleteAt(index);
  }

  Future<void> _readGroupsFromHive() async {
    _groups = (await _box).values.toList();
    notifyListeners();
  }

  Future<void> _setup() async {
    _box = BoxManager.instance.openGroupBox();

    await _readGroupsFromHive();

    _listenable = (await _box).listenable();
    _listenable?.addListener(_readGroupsFromHive);
  }

  @override
  Future<void> dispose() async {
    _listenable?.removeListener(() {
      _readGroupsFromHive();
    });
    await BoxManager.instance.closeBox(await _box);
    super.dispose();
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
