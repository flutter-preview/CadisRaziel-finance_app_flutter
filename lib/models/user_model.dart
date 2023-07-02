import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  //pegar o objeto(classe) e transformar em map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? "",
    );
  }

  //pegar o objeto(classe) e transforma em string
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
