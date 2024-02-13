import 'dart:convert';

class SignInFormModel {
  final String? email;
  final String? password;
  SignInFormModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory SignInFormModel.fromMap(Map<String, dynamic> map) {
    return SignInFormModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInFormModel.fromJson(String source) =>
      SignInFormModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
