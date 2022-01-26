import 'dart:io';

void first() {
  print(1);
  print(2);
  Future.delayed(Duration(seconds: 3))
      .then((_) => print("A few moments later"));
  print(3);
  print(4);
}

void second() {
  File('C:/Users/test0/Documents/file.txt')
      .readAsString()
      .then((_) => print(_));
}

void main() {
  first();
  second();
}
