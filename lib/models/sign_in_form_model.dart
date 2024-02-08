// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignInFormModel {
  final String? email;
  final String? paswwrod;
  SignInFormModel({
    this.email,
    this.paswwrod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'paswwrod': paswwrod,
    };
  }

  factory SignInFormModel.fromMap(Map<String, dynamic> map) {
    return SignInFormModel(
      email: map['email'] != null ? map['email'] as String : null,
      paswwrod: map['paswwrod'] != null ? map['paswwrod'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInFormModel.fromJson(String source) =>
      SignInFormModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
