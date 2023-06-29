// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:finance/services/auth_service.dart';
import 'package:finance/view/sign_in/sign_in_state.dart';

class SignInController extends ChangeNotifier {
  final AuthService _authService;
  SignInController(
    this._authService,
  );

  SignInState _state = SignInInitialState();
  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signIn({ required String email, required String password}) async {
    _changeState(SignInLoadingState());
    try {
      await _authService.signIn(     
        email: email,
        password: password,
      );

      _changeState(SignInSucessState());

    
    } catch (e) {
      _changeState(SignInErrorState(e.toString()));
      
    }
  }
}
