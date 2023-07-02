// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:finance/services/secure_storage.dart';
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

  Future<void> signIn({required String email, required String password}) async {
    const secureStorage = SecureStorage();
    _changeState(SignInLoadingState());
    try {
      //logando com usuario
      final user = await _authService.signIn(
        email: email,
        password: password,
      );

      //salvando usuario no secureStorage
      if (user.id != null) {
        await secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );
        _changeState(SignInSucessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignInErrorState(e.toString()));
    }
  }
}
