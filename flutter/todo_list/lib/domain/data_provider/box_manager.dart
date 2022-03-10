import 'package:hive/hive.dart';
import 'package:todo_list/domain/entities/group.dart';
import 'package:todo_list/domain/entities/task.dart';

class BoxManager {

  // singleton
  static final BoxManager instance = BoxManager._();
  BoxManager._();

  Future<Box<Group>> openGroupBox() async {
    return _openBox('groups_box', 0, GroupAdapter());
  }

  Future<Box<Task>> openTasksBox(int groupKey) async {
    return _openBox(makeTaskBoxName(groupKey), 1, TaskAdapter());
  }

  Future<void> closeBox<T>(Box<T> box) async {
    await box.compact();
    await box.close();
  }

  String makeTaskBoxName(int groupKey) => 'tasks_box_$groupKey';

  Future<Box<T>> _openBox<T>(
      String name, int typeId, TypeAdapter<T> adapter) async {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }
}
