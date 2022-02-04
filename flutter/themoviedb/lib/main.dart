import 'package:flutter/material.dart';

import 'widgets/auth/auth_widget.dart';
import 'widgets/main_screen/main_screen_widget.dart';

void main() {
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 3, 37, 65),
        ),
      ),
      routes: {
        '/': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
      },
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Ошибка навигации'),
            ),
              body: const Center(
                  child: Text('Ошибка навигации')
              )
          );
        });
      },
    );
  }
}
