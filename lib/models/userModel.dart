import 'dart:convert';

class UserModel {
  UserModel({
    this.dateTime,
    this.email,
  });

  final DateTime dateTime;
  final String email;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        dateTime:
            json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime": dateTime == null ? null : dateTime.toIso8601String(),
        "email": email == null ? null : email,
      };
}
