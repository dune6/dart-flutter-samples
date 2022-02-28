import 'package:files_directory/widgets/example_widget_model.dart';
import 'package:flutter/cupertino.dart';

class ExampleWidgetModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;

  const ExampleWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child, notifier: model);

  static ExampleWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ExampleWidgetModelProvider>();
  }

  static ExampleWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleWidgetModelProvider>()
        ?.widget;
    return widget is ExampleWidgetModelProvider ? widget : null;
  }
}
