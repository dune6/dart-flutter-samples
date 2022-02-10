import 'package:flutter/material.dart';
import 'package:themoviedb/theme/app_colors.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_widget.dart';

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
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details_widget': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments as int;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else{
            return MovieDetailsWidget(movieId: 0);
          }
        }
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
