class IncorrectIntString {
  final String incorrectString;

  IncorrectIntString(this.incorrectString);

  @override
  String toString() {
    return 'Ошибка со строкой: $incorrectString';
  }
}

class DivByZero {
  @override
  String toString() {
    return 'Вы поделили на ноль';
  }
}

double div(String a, String b) {
  final aa = int.tryParse(a);
  final bb = int.tryParse(b);

  if (aa == null) return throw IncorrectIntString(a);
  if (bb == null) return throw IncorrectIntString(b);

  if (bb == 0) return throw DivByZero();

  final result = aa / bb;
  return inSquare(result);
}

class NegativeDouble {
  final double incorrect;

  NegativeDouble(this.incorrect);

  @override
  String toString() {
    return 'Число принадлежит (-inf; 1)';
  }
}

double inSquare(double a) {
  if (a < 1) throw NegativeDouble(a);
  return a * a;
}

void main(List<String> args) {
  try {
    print('Это выполнится : )');
    final a = div('2', '-2');
    print('Это не выполнится при ошибке : )');
    print(a);
  } on DivByZero catch (error) {
    print(error);
  } catch (error) {
    print(error);
  } finally {
    print('Я выполнюсь в любом случае = )');
  }
}
