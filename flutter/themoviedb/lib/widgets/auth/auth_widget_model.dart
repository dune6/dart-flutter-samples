import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {



}

class AuthModelProvider extends InheritedNotifier {
  final AuthModel model;

  const AuthModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, child: child, notifier: model);

  static AuthModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthModelProvider>();
  }

  static AuthModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<AuthModelProvider>()
        ?.widget;
    return widget is AuthModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedNotifier<Listenable> oldWidget) {
    return true;
  }
}
