import 'package:flutter/material.dart';
import 'package:key_value_storages/widgets/example_model.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  final _model = ExampleWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: _model.setName, child: const Text('Сохранить имя')),
              ElevatedButton(
                  onPressed: _model.readName, child: const Text('Прочитать имя')),
              ElevatedButton(
                  onPressed: _model.setToken, child: const Text('Сохранить токен')),
              ElevatedButton(
                  onPressed: _model.readToken, child: const Text('Прочитать токен')),
            ],
          ),
        ),
      ),
    );
  }
}
