import 'package:flutter/material.dart';
import 'package:http_requests/domain/api_clients/api_client.dart';
import 'package:http_requests/domain/entity/post.dart';

class ExampleInheritWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();
  final _posts = <Post>[];

  List<Post> get posts => _posts;

  Future<void> reloadPosts() async {
    final posts = await apiClient.getPosts();
    _posts.addAll(posts);
    notifyListeners();
  }

  Future<void> createPost() async {
    final post = await apiClient.createPosts(title: 'Lol', body: 'Lololololo');
  }
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleInheritWidgetModel model;

  const ExampleModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child, notifier: model);

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()
        ?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }
}
