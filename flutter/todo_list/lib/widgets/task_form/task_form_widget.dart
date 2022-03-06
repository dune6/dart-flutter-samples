import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_form/task_form_widget_model.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({Key? key}) : super(key: key);

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  TaskFormWidgetModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TaskFormWidgetModel(groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TasksFormWidgetModelProvider(
      model: _model!,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Новая задача'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: _TaskTextWidget(),
          ),
        ),
      ),
    );
  }
}

class _TaskTextWidget extends StatelessWidget {
  const _TaskTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TasksFormWidgetModelProvider.read(context)?.model;
    return TextField(
      decoration: const InputDecoration(
          border: null, hintText: 'Текст задачи'),
      maxLines: null,
      expands: true,
      autofocus: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: () => model?.saveTask(context),
      onChanged: (value) => model?.taskText = value,
    );
  }
}
