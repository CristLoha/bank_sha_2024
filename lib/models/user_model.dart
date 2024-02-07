import 'dart:convert';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? username;
  final int? verified;
  final String? profilePicture;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.verified,
    this.profilePicture,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'verified': verified,
      'profile_picture': profilePicture,
      'balance': balance,
      'card_number': cardNumber,
      'pin': pin,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      username: map['username'],
      verified: map['verified'],
      profilePicture: map['profile_picture'],
      balance: map['balance'],
      cardNumber: map['card_number'],
      pin: map['pin'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
