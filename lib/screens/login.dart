import 'dart:async';
import 'package:flutter/material.dart';

import 'package:kwilox_/models/constant.dart';
import 'package:kwilox_/models/login_model.dart';
import 'package:kwilox_/register/home.dart';
import 'package:kwilox_/screens/registerScreen.dart';
import 'package:kwilox_/service/resources.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();
  get body => null;

  @override
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 350,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset('assets/logo.png'),
                ),
              ]),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
              ),
              child: Form(
                key: _loginKey,
                child: Column(
                  children: [
                    buildTextFormField(Icons.mail, 'Enter E-Mail Address',
                        false, false, false, false, true, false, _email),
                    buildTextFormField(Icons.lock, 'Password', false, false,
                        false, false, false, true, _password),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
                        _isLogin();
                      },
                      height: 45,
                      color: const Color(0xFFB23F3F),
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 105, vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Color(0xFFB23F3F),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _isLogin() async {
    if (_loginKey.currentState?.validate() ?? false) {
      _loginKey.currentState?.save();
      Login user = Login(
        email: _email.text,
        password: _password.text,
      );
      setState(() {
        _isLoading = true;
      });
      var response = await LoginUser.loginUser(user);
      setState(() {
        _isLoading = false;
      });
      if (response is Success) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print('error');
      }
    } else {
      print('error');
    }
  }

  Widget buildTextFormField(
      IconData icon,
      String hintText,
      bool isFirstName,
      bool isLastName,
      bool isPhoneNumber,
      bool isAge,
      bool isEmail,
      bool isPassword,
      var entercontroller) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
      child: TextFormField(
        controller: entercontroller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: getProportionateScreenWidth(20),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          contentPadding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(10),
              getProportionateScreenHeight(10),
              getProportionateScreenWidth(10),
              getProportionateScreenHeight(10)),
          hintText: hintText,
          hintStyle: TextStyle(
              fontFamily: kfontFamily,
              fontSize: getProportionateScreenWidth(14),
              color: Palette.textColor1),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}

void setState(Null Function() param0) {}
