class Car {
  int currentSpeed = 60;
  static int totalCarCount = 1000;

  void printSpeed() {
    print(currentSpeed);
  }

  static void printTotalCarCount() {
    print(totalCarCount);
  }
}

void main(List<String> args) {
  final car = Car();
  car.printSpeed();
  Car.printTotalCarCount();
}
