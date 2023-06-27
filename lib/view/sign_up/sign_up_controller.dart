import 'package:finance/services/auth_service.dart';
import 'package:finance/view/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _authService; //Repare que eu injeto a interface
  SignUpController(this._authService);
  var logger = Logger();

  SignUpState _state = SignUpInitialState();
  SignUpState get state => _state;
  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp({required String name, required String email, required String password}) async {
    _changeState(SignUpLoadingState());
    try {
      await _authService.signUp(
        name: name,
        email: email,
        password: password,
      );

      _changeState(SignUpSucessState());

    
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
      
    }
  }
}
