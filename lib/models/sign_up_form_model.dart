import 'dart:convert';

class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? profilePicture;
  final String? pin;
  final String? ktp;

  SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.profilePicture,
    this.pin,
    this.ktp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
      'pin': pin,
      'ktp': ktp,
    };
  }

  String toJson() => json.encode(toMap());

  SignUpFormModel copyWith(
          {String? pin, String? profilePicture, String? ktp}) =>
      SignUpFormModel(
        name: name,
        email: email,
        password: password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );
}
