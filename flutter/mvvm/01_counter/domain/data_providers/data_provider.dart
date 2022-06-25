import 'package:mvvm_counter/domain/entity/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider {
  final sf = SharedPreferences.getInstance();

  Future<User> loadValue() async {
    final age = (await sf).getInt('age') ?? 0;
    return User(age);
  }

  Future<void> safeValue(User user) async {
    (await sf).setInt('age', user.age);
  }
}
