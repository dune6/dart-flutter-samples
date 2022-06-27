// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mvvm_counter/domain/data_providers/auth_api_provider.dart';
import 'package:mvvm_counter/domain/services/auth_service.dart';

enum _ViewModelAuthButtonState { canSubmit, authProcess, disable }

class _ViewModelState {
  final String authErrorTitle;
  final String login;
  final String password;
  final bool isAuthInProcess;
  _ViewModelAuthButtonState get authButtonState {
    if (isAuthInProcess) {
      return _ViewModelAuthButtonState.authProcess;
    } else if (login.isNotEmpty && password.isNotEmpty) {
      return _ViewModelAuthButtonState.canSubmit;
    } else {
      return _ViewModelAuthButtonState.disable;
    }
  }

  _ViewModelState({
    this.authErrorTitle = '',
    this.login = '',
    this.password = '',
    this.isAuthInProcess = false,
  });

  _ViewModelState copyWith({
    String? authErrorTitle,
    String? login,
    String? password,
    bool? isAuthInProcess,
  }) {
    return _ViewModelState(
      authErrorTitle: authErrorTitle ?? this.authErrorTitle,
      login: login ?? this.login,
      password: password ?? this.password,
      isAuthInProcess: isAuthInProcess ?? this.isAuthInProcess,
    );
  }
}

class _ViewModel extends ChangeNotifier {
  final _authService = AuthService();
  var _state = _ViewModelState(authErrorTitle: '');
  _ViewModelState get state => _state;

  void changeLogin(String value) {
    if (_state.login == value) return;
    _state = _state.copyWith(login: value);
    notifyListeners();
  }

  void changePassword(String value) {
    if (_state.password == value) return;
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  Future<void> onAuthButtonPressed(BuildContext context) async {
    final login = _state.login;
    final password = _state.password;

    if (login.isEmpty || password.isEmpty) return;

    _state = _state.copyWith(authErrorTitle: '', isAuthInProcess: true);
    notifyListeners();

    try {
      await _authService.login(login, password);
      _state = _state.copyWith(isAuthInProcess: false);
      notifyListeners();
      Navigator.of(context).pushNamedAndRemoveUntil('loader', (route) => false);
    } on AuthApiProviderIncorrectLoginData {
      _state = _state.copyWith(
          authErrorTitle: 'Error login or password!', isAuthInProcess: false);
      notifyListeners();
    } catch (exception) {
      _state = _state.copyWith(
          authErrorTitle: 'Something get wrong...', isAuthInProcess: false);
      notifyListeners();
    }
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => _ViewModel(),
      child: const AuthWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LoginWidget(),
              SizedBox(
                height: 10,
              ),
              _PasswordWidget(),
              SizedBox(
                height: 10,
              ),
              _ErrorWidget(),
              SizedBox(
                height: 10,
              ),
              _AuthButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginWidget extends StatelessWidget {
  const _LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Login',
        border: OutlineInputBorder(),
      ),
      onChanged: model.changeLogin,
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      onChanged: model.changePassword,
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authErrorTitle =
        context.select((_ViewModel value) => value.state.authErrorTitle);
    return Text(
      authErrorTitle,
      style: TextStyle(color: Colors.red.shade900),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    final authButtonState =
        context.select((_ViewModel value) => value.state.authButtonState);

    final onPressed = authButtonState == _ViewModelAuthButtonState.canSubmit
        ? model.onAuthButtonPressed
        : null;

    final child = authButtonState == _ViewModelAuthButtonState.authProcess
        ? const CircularProgressIndicator()
        : const Text('Sign in');

    return ElevatedButton(
      onPressed: () => onPressed?.call(context),
      child: child,
    );
  }
}
