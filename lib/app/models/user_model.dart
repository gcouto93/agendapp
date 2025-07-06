import 'dart:convert';

class UserModel {
  final String email;
  final String? registerType;
  final String? imgAvatar;

  UserModel({
    required this.email,
    required this.registerType,
    required this.imgAvatar,
  });

  UserModel.empty()
      : email = '',
        registerType = '',
        imgAvatar = '';

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      registerType: json['registerType'] as String,
      imgAvatar: json['imgAvatar'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'registerType': registerType,
      'imgAvatar': imgAvatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      registerType: map['registerType'] as String?,
      imgAvatar: map['imgAvatar'] as String?,
    );
  }
  String toJson() => json.encode(toMap());
}
