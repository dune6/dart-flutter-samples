mixin Flyable {
  void fly() {
    print('It\'s flying');
  }
}

mixin Beast {
  void breathe() {
    print('I can breath');
  }
}

mixin Mechanism {
  void repair() {
    print('It can be repaired');
  }

  void fly() {
    print('It\'s flying mechanism');
  }
}

class Duck with Beast, Flyable {}

class Airplane with Flyable, Mechanism {}

void main(List<String> args) {
  Duck()
    ..fly()
    ..breathe();

  Airplane()
    ..fly()
    ..repair();
}
