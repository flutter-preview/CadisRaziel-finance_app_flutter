
import 'package:finance/view/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignUpController extends ChangeNotifier{
   var logger = Logger();

  SignUpState _state = SignUpInitialState();
  SignUpState get state => _state;
  void _changeState(SignUpState newState){
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    _changeState(SignUpLoadingState());
   try {
      await Future.delayed(Duration(seconds: 2));
      // throw Exception("Erro ao logar"); //-> para simular um erro
    logger.i("usuario logado");

    _changeState(SignUpSucessState());

    return true;
   } catch (e) {
    _changeState(SignUpErrorState());
    return false;
   }
  }
}