import 'package:flutter/material.dart';
import 'package:todo_list/ui/widgets/group_form/group_form_widget_model.dart';

class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({Key? key}) : super(key: key);

  @override
  State<GroupFormWidget> createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  final _model = GroupFormWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupFormWidgetModelProvider(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Новая группа'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: _GroupNameWidget(),
          ),
        ),
      ),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupFormWidgetModelProvider.read(context)?.model;
    return TextField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), helperText: 'Имя группы'),
      maxLines: 1,
      autofocus: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: () =>
          model?.saveGroup(context),
      onChanged: (value) => model?.groupName = value,
    );
  }
}
