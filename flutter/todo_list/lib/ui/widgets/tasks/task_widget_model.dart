import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/entities/group.dart';
import 'package:todo_list/domain/entities/task.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';

class TasksWidgetModel extends ChangeNotifier {
  int groupKey;
  late final Future<Box<Group>> _groupBox;

  var _tasks = <Task>[];

  List<Task> get tasks => _tasks.toList();

  Group? _group;

  Group? get group => _group;

  TasksWidgetModel({required this.groupKey}) {
    _setup();
  }

  void _loadGroup() async {
    final box = await _groupBox;
    _group = box.get(groupKey);
    notifyListeners();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRoutes.tasksForm, arguments: groupKey);
  }

  void _setupListen() async {
    final box = await _groupBox;
    _readTasks();
    box.listenable(keys: [groupKey]).addListener(_readTasks);
  }

  void deleteTask(int taskIndex) {
    unawaited(_group?.tasks?.deleteFromHive(taskIndex));
    notifyListeners();
  }

  void doneToggle(int index) async {
    final currentState = group?.tasks?[index].isDone ?? false;
    group?.tasks?[index].isDone = !currentState;
    group?.tasks?[index].save();
    notifyListeners();
  }

  void _setup() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(GroupAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    _groupBox = Hive.openBox<Group>('groups_box');
    Hive.openBox<Task>('tasks_box');
    _loadGroup();
    _setupListen();
  }

  void _readTasks() {
    _tasks = _group?.tasks ?? <Task>[];
    notifyListeners();
  }
}

class TasksWidgetModelProvider extends InheritedNotifier {
  final TasksWidgetModel model;

  const TasksWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child, notifier: model);

  static TasksWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TasksWidgetModelProvider>();
  }

  static TasksWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TasksWidgetModelProvider>()
        ?.widget;
    return widget is TasksWidgetModelProvider ? widget : null;
  }
}
