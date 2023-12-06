import 'package:provider_test/bloc/base_bloc.dart';

class HomePageBloc extends BaseBloc {
  int _number1 = 0;

  int get getNumber1 => _number1;

  int _number2 = 100;

  int get getNumber2 => _number2;

  bool _check = false;

  bool get isCheck => _check;

  int? asynValue;

  HomePageBloc() {
    Future.delayed(const Duration(seconds: 10)).then((value) {
      asynValue = 100;
      notifyListeners();
    });
  }

  set setCheckState(bool check) {
    _check = check;
    notifyListeners();
  }

  void increaseNumber1() {
    _number1 = _number1 + 1;
    notifyListeners();
  }

  void decreaseNumber2() {
    _number2 = _number2 - 1;
    notifyListeners();
  }
}
