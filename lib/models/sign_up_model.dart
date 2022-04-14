



class SignUp {
  SignUp({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });

  String firstName;
  String lastName;
  String age;
  String email;
  String password;
  String phoneNumber;
  String role;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        age: json["age"] == null ? null : json["age"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "age": age == null ? null : age,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "role": role == null ? null : role,
      };
}

//

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
