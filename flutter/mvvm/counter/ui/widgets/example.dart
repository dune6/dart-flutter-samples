import 'package:flutter/material.dart';
import 'package:mvvm_counter/domain/services/user_service.dart';
import 'package:provider/provider.dart';

class ViewModelState {
  final String ageTitle;

  ViewModelState(this.ageTitle);
}

// view model
class ViewModel extends ChangeNotifier {
  final _userService = UserService();

  var _state = ViewModelState('');
  ViewModelState get state => _state;

  void loadValue() async {
    await _userService.initialize();
    _updateState();
  }

  ViewModel() {
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

  void _updateState() {
    final user = _userService.user;
    _state = ViewModelState(user.age.toString());
    notifyListeners();
  }
}

// view
class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    final title = context.select((ViewModel vm) => vm.state.ageTitle);
    return Text(title);
  }
}

class _AgeIncrementWidget extends StatelessWidget {
  const _AgeIncrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModel>();
    return ElevatedButton(
        onPressed: viewModel.onIncrementButtonPressed, child: const Text('+'));
  }
}

class _AgeDecrementWidget extends StatelessWidget {
  const _AgeDecrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModel>();
    return ElevatedButton(
        onPressed: viewModel.onDecrementButtonPressed, child: const Text('-'));
  }
}
