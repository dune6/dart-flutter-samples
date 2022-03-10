import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entities/task.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';
import 'package:todo_list/ui/widgets/tasks/task_widget.dart';

class TasksWidgetModel extends ChangeNotifier {
  final TaskWidgetConfiguration configuration;
  late final Future<Box<Task>> _box;
  var _tasks = <Task>[];
  ValueListenable<Object>? _listenable;

  get tasks => _tasks.toList();

  TasksWidgetModel({required this.configuration}) {
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRoutes.tasksForm,
        arguments: configuration.groupKey);
  }

  void deleteTask(int taskIndex) async {
    await (await _box).deleteAt(taskIndex);
  }

  void doneToggle(int index) async {
    final task = (await _box).getAt(index);
    task?.isDone = !task.isDone;
    notifyListeners();
  }

  Future<void> _setup() async {
    _box = BoxManager.instance.openTasksBox(configuration.groupKey);
    await _readTasksFromHive();
    _listenable?.addListener(_readTasksFromHive);
  }

  Future<void> _readTasksFromHive() async {
    _tasks = (await _box).values.toList();
    notifyListeners();
  }

  @override
  Future<void> dispose() async {
    _listenable?.removeListener(() {
      _readTasksFromHive();
    });
    await BoxManager.instance.closeBox(await _box);
    super.dispose();
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
