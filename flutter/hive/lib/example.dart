import 'package:flutter/material.dart';
import 'package:hive_basics/example_model.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final model = ExampleWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => model.doSome(),
            child: const Text('Жми меня'),
          ),
        ),
      ),
    );
  }
}
