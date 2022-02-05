import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
            style: textStyle,
          ),
          TextButton(onPressed: () {}, child: const Text('Регистрация')),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
            style: textStyle,
          ),
          TextButton(
              onPressed: () {}, child: const Text('Отправить письмо повторно')),
          const SizedBox(
            height: 25,
          ),
          const _FormWidget(),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');

  String? _errorText;

  void _auth() {
    final loginText = _loginTextController.text;
    final passwordText = _passwordTextController.text;
    if (loginText == 'admin' && passwordText == 'admin') {
      _errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      _errorText = 'Не верный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {}

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Color(0xFF212529));
    const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(10),
      isCollapsed: true,
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_errorText != null) ...[
          Text(
            _errorText!,
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
        const Text(
          'Логин',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text('Пароль', style: textStyle),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500))),
                onPressed: _auth,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Войти'),
                )),
            const SizedBox(
              width: 30,
            ),
            const Spacer(),
            TextButton(
              onPressed: _resetPassword,
              child: const Text('Восстановить пароль'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500))),
            ),
          ],
        )
      ],
    );
  }
}
