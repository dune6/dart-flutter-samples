import 'dart:math';

enum Color {
  Red,
  Green,
  Blue,
}

abstract class Shape {
  double get square;
  final Color color;

  Shape(this.color);

  @override
  String toString() {
    return '$color, $square';
  }
}

class Triangle extends Shape {
  final int side1;
  final int side2;
  final int side3;

  @override
  double get square {
    final double p = (side1 + side2 + side3) / 2;
    return sqrt(p * (p - side1) * (p - side2) * (p - side3));
  }

  Triangle(Color color, this.side1, this.side2, this.side3) : super(color);
}

class Circle extends Shape {
  final int radius;

  @override
  double get square => pi * pow(radius, 2);

  Circle(Color color, this.radius) : super(color);
}

class Square extends Shape {
  final int side;

  @override
  double get square => (side * side).toDouble();

  Square(Color color, this.side) : super(color);
}

void main(List<String> args) {
  final triangle = Triangle(Color.Red, 15, 22, 17);
  final circle = Circle(Color.Green, 1234);
  final square = Square(Color.Blue, 94);

  print(triangle);

  print(circle);

  print(square);
}
