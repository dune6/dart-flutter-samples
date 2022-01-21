int multTwo(int a) {
  return a * 2;
}

int multFour(int a) => multTwo(multTwo(a));

int runFuncTwice(int a, int Function(int a) f) {
  for (var i = 0; i < 2; ++i) {
    a = f(a);
  }

  return a;
}

void main(List<String> arguments) {
  print(runFuncTwice(1, multFour));
}
