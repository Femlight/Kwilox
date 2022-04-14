import 'package:get/get.dart';
import 'package:http/http.dart';


class Login {
    Login({
        
        required this.email,
        required this.password,
       
    });

   
    String email;
    String password;
   

    factory Login.fromJson(Map<String, dynamic> json) => Login(
       
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
       
    );

    Map<String, dynamic> toJson() => {
       
        "email": email == null ? null : email,
        "password": password == null ? null : password,
       
    };
}
