import 'package:flutter/material.dart';
import 'package:hive_basics/example.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // if main is async
  // You only need to call this method
  // if you need the binding to be initialized
  // before calling runApp.
  WidgetsFlutterBinding.ensureInitialized();
  // init Hive
  await Hive.initFlutter();
  // run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Example(),
    );
  }
}
