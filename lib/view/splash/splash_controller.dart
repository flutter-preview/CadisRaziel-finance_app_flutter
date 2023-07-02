import 'package:finance/services/auth_service.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:finance/view/sign_up/sign_up_state.dart';
import 'package:finance/view/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SplashController extends ChangeNotifier {

  final SecureStorage _secureStorage; //Repare que eu injeto a interface

  SplashController(this._secureStorage);

  var logger = Logger();

  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  //verificar se o usuario esta logado
  void isUserLogged() async {
    await Future.delayed(const Duration(seconds: 2)); //-> para que ao fechar o app e abrir de novo a splashpage nao apareça por 100 millisegundos e sim por 2 segundos
    final result = await _secureStorage.readOne(key: "CURRENT_USER");

    if(result != null) {
      _changeState(SplashSucessState());
    } else {
      _changeState(SplashErrorState(
        "Ocorreu um erro ao entrar"
      ));
    }
  }

}
 