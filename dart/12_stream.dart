import 'dart:async';

Stream<int>? stream;
StreamSubscription<int>? subscription;
StreamController<int> controller = StreamController<int>();

void example1() {
  print('one');
  stream = Stream.periodic(Duration(seconds: 1), (tick) => tick);
  print('two');
  // слушаем поток подпиской на поток
  subscription = stream?.listen((event) {
    print(event);
  });
  Future.delayed(Duration(seconds: 5), () => subscription?.pause());
  Future.delayed(Duration(seconds: 10), () => subscription?.resume());
  Future.delayed(Duration(seconds: 15), () => subscription?.cancel());
}

void main() {
  print('one');
  controller.add(1);
  controller.add(2);
  controller.add(3);
  controller.add(4);
  controller.add(5);
  print('two');

  subscription = controller.stream.listen((event) {
    print(event);
  });
  controller.add(6);
  controller.add(7);
  controller.add(8);
  controller.add(9);
  controller.add(10);

  Future.delayed(Duration(seconds: 10), () async {
    controller.add(11);
    subscription?.cancel();
    controller.close();
  });
}
