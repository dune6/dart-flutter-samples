import 'package:flutter/material.dart';
import 'package:todo_list/ui/widgets/group_form/group_form_widget.dart';
import 'package:todo_list/ui/widgets/groups/groups_widget.dart';
import 'package:todo_list/ui/widgets/task_form/task_form_widget.dart';
import 'package:todo_list/ui/widgets/tasks/task_widget.dart';

abstract class MainNavigationRoutes {
  static const groups = '/';
  static const groupsForm = '/form';
  static const tasks = '/tasks';
  static const tasksForm = '/tasks/form';
}

class MainNavigation {
  final initialRoute = MainNavigationRoutes.groups;
  final routes = {
    MainNavigationRoutes.groups: (context) => const GroupsWidget(),
    MainNavigationRoutes.groupsForm: (context) => const GroupFormWidget(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutes.tasks:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) {
            return TaskWidget(groupKey: groupKey);
          },
        );
      case MainNavigationRoutes.tasksForm:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) {
            return TaskFormWidget(groupKey: groupKey);
          },
        );
      default:
        const widget = Text('ERROR');
        return MaterialPageRoute(
          builder: (context) {
            return widget;
          },
        );
    }
  }
}
