import 'package:flutter/material.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entities/task.dart';

class TaskFormWidgetModel {
  int groupKey;
  var taskText = '';

  TaskFormWidgetModel({required this.groupKey}) {}

  void saveTask(BuildContext context) async {
    if (taskText.isEmpty) return;
    final box = await BoxManager.instance.openTasksBox(groupKey);
    final task = Task(text: taskText, isDone: false);
    await box.add(task);
    Navigator.of(context).pop();
  }
}

class TasksFormWidgetModelProvider extends InheritedWidget {
  final TaskFormWidgetModel model;

  const TasksFormWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static TasksFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TasksFormWidgetModelProvider>();
  }

  static TasksFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TasksFormWidgetModelProvider>()
        ?.widget;
    return widget is TasksFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(TasksFormWidgetModelProvider old) {
    return true;
  }
}
