import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedNavBarItem = 0;

  void onSelectTab(int index) {
    setState(() {
      if (_selectedNavBarItem == index) return;
      _selectedNavBarItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DuneTV'),
      ),
      body: IndexedStack(
        index: _selectedNavBarItem,
        children: const [
          Text('Новости'),
          MovieListWidget(),
          Text('Сериалы'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavBarItem,
        items: const [
          BottomNavigationBarItem(
            label: 'Новости',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Фильмы',
            icon: Icon(Icons.movie_creation_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Сериалы',
            icon: Icon(Icons.live_tv),
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
