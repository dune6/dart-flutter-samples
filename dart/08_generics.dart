// generic function
T sum<T extends num>(T a, T b) {
  return (a + b) as T;
}

// generic class
class Stack<Element> {
  var storage = <Element>[];
  // FILO
  void push(Element a) => storage.insert(0, a);
  Element pop() => storage.removeLast();

  @override
  String toString() {
    return storage.toString();
  }
}

String some<T, Z>(T a, Z b) {
  return '$a, $b';
}

void main(List<String> args) {
  final a = sum(3.3, 4);
  print(a);

  final stack = Stack();
  stack.push(32);
  stack.push(42);
  stack.push(6);
  stack.push("Element 0");
  print(stack);
  stack.pop();
  stack.pop();
  print(stack);

  print(some('fdsd', 321.321));
}
