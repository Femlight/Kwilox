import 'package:get/get.dart';
import 'package:http/http.dart';

class ResendVerificationCode {
  ResendVerificationCode({
    required this.email,
  });

  String email;

  factory ResendVerificationCode.fromJson(Map<String, dynamic> json) =>
      ResendVerificationCode(
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
      };
}
