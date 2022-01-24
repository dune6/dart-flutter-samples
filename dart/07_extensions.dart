void main(List<String> args) {
  final a = 5;
  final b = '5';
  a.toDouble();
  print(b.toDouble());
}

extension StringToDouble on String {
  double? toDouble() {
    return double.tryParse(this);
  }
}
