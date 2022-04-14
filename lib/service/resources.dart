// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kwilox_/models/login_model.dart';
import 'package:kwilox_/models/shareData.dart';
import 'package:kwilox_/models/sign_up_model.dart';
import 'package:kwilox_/models/verify_model.dart';
import '../models/sign_up_model.dart';

const String baseUrl = 'https://kwilox.herokuapp.com';
const String signUpRequest = baseUrl + '/api/v1/register-user';
const String resendverificationRequest = baseUrl + '/api/v1/resend-verification-link';
const String loginRequest = baseUrl + '/api/v1/user-login';
const String fetchUserRequest = baseUrl + '/api/v1/fetch-items';

class SignUpUser {
  static final Dio dio = Dio();
  static Future<Result> createPost(SignUp model) async {
    try {
      var response = await dio.post(signUpRequest, data: model.toJson());
      if (response.statusCode == 201) {
        print(response);
        var verifyResponse = await dio
            .post(resendverificationRequest, data: {"email": "${model.email}"});
        print(verifyResponse);
        return Success(response: response.data);
      } else {
        print(response.statusCode);
        return Failure(error: 'Unable to Sign Up');
      }
    } catch (e) {
      print(e);
      if (e is SocketException) {
        return Failure(error: 'No internet connection');
      } else {
        return Failure(error: 'Unable to connect to server');
      }
    }
  }
}

class LoginUser {
  static final Dio dio = Dio();
  static Future<Result> loginUser(Login model) async {
    try {
      var response = await dio.post(loginRequest, data: model.toJson());
      if (response.statusCode == 200) {
        var bearerToken = response.data['token'];
        print(bearerToken);
        SharedDataRepository.instance.setToken(bearerToken);
        print(response);
        return Success(response: response.data);
      } else {
        return Failure(error: 'Unable to Log in User');
      }
    } catch (e) {
      print('in catch' + e.toString());
      if (e is SocketException) {
        return Failure(error: 'No internet connection');
      } else {
        return Failure(error: 'Unable to connect to server');
      }
    }
  }
}

abstract class Result {}

class Success extends Result {
  final dynamic response;
  Success({required this.response});
}

class Failure extends Result {
  final String error;
  Failure({required this.error});
}
