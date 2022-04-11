import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => Controller();
}

class Controller extends State<ExampleScreen> {
  var _posts = <dynamic>[];

  Future<void> _loadPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await get(url);
    final json = jsonDecode(response.body) as List<dynamic>;
    _posts += json;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Provider(child: const _View(), state: this);
  }
}

class Provider extends InheritedWidget {
  final Controller state;

  const Provider({Key? key, required Widget child, required this.state})
      : super(key: key, child: child);

  static Provider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }

  static Provider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<Provider>()?.widget;
    return widget is Provider ? widget : null;
  }

  @override
  bool updateShouldNotify(Provider old) {
    return state != old.state;
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<Provider>()!.state;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: state._loadPosts, child: const Text('Загрузить')),
            Expanded(
                child: ListView.builder(
              itemCount: state._posts.length,
              itemBuilder: (context, index) {
                return _RowWidget(
                  title: state._posts[index]['title'] as String,
                  body: state._posts[index]['body'] as String,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

class _RowWidget extends StatelessWidget {
  final String title;
  final String body;

  const _RowWidget({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(title),
          Text(body),
          // Text(_posts[index]['title'] as String),
          // Text(_posts[index]['body'] as String),
          const Divider(
            height: 30,
          )
        ],
      ),
    );
  }
}
