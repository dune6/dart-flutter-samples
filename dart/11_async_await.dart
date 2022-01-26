Future<int> sum(int a, int b) {
  return Future.sync(() => a + b);
}

Future<void> example() async {
  final a = await sum(1, 4);
  print(a);
  final b = await sum(a, 9);
  print(b);
  final c = await sum(b, a);
  print(c);
}

void main(List<String> args) {
  print('Start');
  example();
  print('End');
}
