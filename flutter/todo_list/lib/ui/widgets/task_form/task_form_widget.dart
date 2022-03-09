import 'package:flutter/material.dart';
import 'package:todo_list/ui/widgets/task_form/task_form_widget_model.dart';

class TaskFormWidget extends StatefulWidget {
  final int groupKey;

  const TaskFormWidget({Key? key, required this.groupKey}) : super(key: key);

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  late final TaskFormWidgetModel _model;

  @override
  void initState() {
    super.initState();

    _model = TaskFormWidgetModel(groupKey: widget.groupKey);
  }

  @override
  Widget build(BuildContext context) {
    return TasksFormWidgetModelProvider(
      model: _model,
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
