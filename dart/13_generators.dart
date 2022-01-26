Iterable<int> generator1() sync* {
  yield 5;
  for (var i = 0; i < 10; ++i) {
    yield i;
  }
}

Stream<int> generator2() async* {
  yield 5;
  for (var i = 0; i < 10; ++i) {
    yield i;
  }
}

void main(List<String> args) {
  final result1 = generator1();
  print(result1);

  final result2 = generator2();
  result2.listen((event) {
    print(event);
  });
  print(result2);
}
