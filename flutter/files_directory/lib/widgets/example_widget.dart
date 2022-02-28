import 'package:files_directory/widgets/example_widget_model.dart';
import 'package:files_directory/widgets/example_widget_model_provider.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  final _model = ExampleWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExampleWidgetModelProvider(
            model: _model,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _ReadFileButton(),
                ],
              ),
            )),
      ),
    );
  }
}

class _ReadFileButton extends StatelessWidget {
  const _ReadFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            ExampleWidgetModelProvider.read(context)!.model.readFile(),
        child: const Text('Прочитать файл'));
  }
}
