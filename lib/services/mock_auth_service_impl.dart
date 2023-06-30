import 'package:finance/models/user_model.dart';
import 'package:finance/services/auth_service.dart';

class MockAuthServiceImpl implements AuthService {


  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
      await Future.delayed(Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(id: email.hashCode.toString(), name: name, email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw "Senha fraca, digite uma senha mais forte";
      }
      throw "Não foi possível criar o usuário";
    }
  }

  @override
  Future<UserModel> signIn({required String email, required String password}) async {
      await Future.delayed(Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(id: email.toString(), email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw "Erro ao logar";
      }
      throw "Não foi possível fazer o login";
    }
  }
}
