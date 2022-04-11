import 'package:flutter/material.dart';

void main() {
  // вывод виджета
  runApp(
    const Center(
      child: Text(
        "Some string",
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
