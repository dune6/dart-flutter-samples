import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_serialization/example_data.dart';

import 'human.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: JsonExampleProvider(
          coder: JsonExampleCoder(),
          child: const ButtonWidget(),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: JsonExampleProvider.read(context)?.coder.encode,
            child: const Text('Кодировать')),
        ElevatedButton(
            onPressed: JsonExampleProvider.read(context)?.coder.decode,
            child: const Text('Декодировать')),
      ],
    );
  }
}

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;

  const JsonExampleProvider({
    Key? key,
    required this.coder,
    required Widget child,
  }) : super(key: key, child: child);

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
    return widget is JsonExampleProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(JsonExampleProvider old) {
    return true;
  }
}

class JsonExampleCoder {
  void encode() {
    final objects = humans.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(objects);
  }

  void decode() {
    try {
      final json = jsonDecode(jsonString) as List<dynamic>;
      final humans = json
          .map((dynamic e) => Human.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
