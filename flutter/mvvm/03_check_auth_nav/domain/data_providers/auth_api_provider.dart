abstract class AuthApiProviderError {}

class AuthApiProviderIncorrectLoginData {}

class AuthApiProvider {
  Future<String> login(String login, String password) async {
    final isSuccess = (login == 'admin' && password == '123456');
    if (isSuccess) {
      return 'fme309w213mdq343';
    } else {
      throw AuthApiProviderIncorrectLoginData();
    }
  }
}
