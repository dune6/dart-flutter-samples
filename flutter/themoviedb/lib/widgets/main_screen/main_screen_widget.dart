import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedNavBarItem = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Новости'),
    Text('Фильмы'),
    Text('Сериалы'),
  ];

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
      body: Center(
        child: _widgetOptions[_selectedNavBarItem],
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
