import 'package:flutter/material.dart';
import 'package:mvvm_counter/ui/widgets/auth_widget.dart';
import 'package:mvvm_counter/ui/widgets/example.dart';
import 'package:mvvm_counter/ui/widgets/loader_widget.dart';

void main() {
  const app = MyApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        'example': (_) => ExampleWidget.create(),
        'auth': (_) => AuthWidget.create(),
        'loader': (_) => LoaderWidget.create(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoaderWidget.create(),
    );
  }
}
