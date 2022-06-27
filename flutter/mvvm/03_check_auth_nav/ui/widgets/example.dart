import 'package:flutter/material.dart';
import 'package:mvvm_counter/domain/services/auth_service.dart';
import 'package:mvvm_counter/domain/services/user_service.dart';
import 'package:provider/provider.dart';

class _ViewModelState {
  final String ageTitle;

  _ViewModelState(this.ageTitle);
}

// view model
class _ViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final _userService = UserService();

  var _state = _ViewModelState('');
  _ViewModelState get state => _state;

  void loadValue() async {
    await _userService.initialize();
    _updateState();
  }

  _ViewModel() {
    loadValue();
  }

  void onIncrementButtonPressed() {
    _userService.incrementAge();
    _updateState();
  }

  void onDecrementButtonPressed() {
    _userService.decrementAge();
    _updateState();
  }

  Future<void> onLogoutButtonPressed(BuildContext context) async {
    await _authService.logout();
    Navigator.of(context).pushNamedAndRemoveUntil('loader', (route) => false);
  }

  void _updateState() {
    final user = _userService.user;
    _state = _ViewModelState(user.age.toString());
    notifyListeners();
  }
}

// view
class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
        create: (context) => _ViewModel(), child: const ExampleWidget());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () => viewModel.onLogoutButtonPressed(context),
              child: const Text('Logout'))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AgeTitle(),
              _AgeIncrementWidget(),
              _AgeDecrementWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgeTitle extends StatelessWidget {
  const _AgeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.select((_ViewModel vm) => vm.state.ageTitle);
    return Text(title);
  }
}

class _AgeIncrementWidget extends StatelessWidget {
  const _AgeIncrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();
    return ElevatedButton(
        onPressed: viewModel.onIncrementButtonPressed, child: const Text('+'));
  }
}

class _AgeDecrementWidget extends StatelessWidget {
  const _AgeDecrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();
    return ElevatedButton(
        onPressed: viewModel.onDecrementButtonPressed, child: const Text('-'));
  }
}
