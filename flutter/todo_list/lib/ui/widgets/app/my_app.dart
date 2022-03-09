import 'package:flutter/material.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
