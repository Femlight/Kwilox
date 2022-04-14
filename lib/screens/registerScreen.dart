import 'package:flutter/material.dart';
import 'package:kwilox_/models/constant.dart';
import 'package:kwilox_/models/sign_up_model.dart';
import 'package:kwilox_/screens/verification.dart';

import 'package:kwilox_/screens/login.dart';
import 'package:kwilox_/service/resources.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _age = TextEditingController();
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
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 320,
                decoration: const BoxDecoration(
                  color: Color(0xFFB23F3F),
                ),
                child: Column(
                  children: const [
                    SafeArea(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                          child: Text(
                            "Welcome to ",
                            style: TextStyle(
                                wordSpacing: 2,
                                letterSpacing: 5,
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: "colfax",
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "KWILOX",
                      style: TextStyle(
                          letterSpacing: 12,
                          fontSize: 38,
                          color: Colors.white,
                          fontFamily: "oleoScript",
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal),
                    ),
                    Text(
                      "Relaxation Center",
                      style: TextStyle(
                          wordSpacing: 5,
                          letterSpacing: 7,
                          fontSize: 10,
                          color: Colors.white,
                          fontFamily: "colfax",
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
              ),
              child: Form(
                key: _signupKey,
                child: Column(
                  children: [
                    buildTextFormField(Icons.person, 'First Name', true, false,
                        false, false, false, false, _firstName),
                    buildTextFormField(Icons.person, 'Last Name', false, true,
                        false, false, false, false, _lastName),
                    buildTextFormField(Icons.mail, 'Enter E-Mail Address',
                        false, false, false, false, true, false, _email),
                    buildTextFormField(Icons.calendar_month, 'Age', false,
                        false, false, true, false, false, _age),
                    buildTextFormField(Icons.phone_android, 'Phone Number',
                        false, false, true, false, false, false, _phoneNumber),
                    buildTextFormField(Icons.lock, 'Password', false, false,
                        false, false, false, true, _password),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(321, 51.91),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: "colfax",
                      ),
                      primary: const Color(0xFFB23F3F),
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 105, vertical: 17)),
                  onPressed: () {
                    _isSignUp();
                  },
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text('Register')),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
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

  void _isSignUp() async {
    if (_signupKey.currentState?.validate() ?? false) {
      _signupKey.currentState?.save();
      SignUp user = SignUp(
        firstName: _firstName.text,
        lastName: _lastName.text,
        age: _age.text,
        email: _email.text,
        password: _password.text,
        phoneNumber: _phoneNumber.text,
        role: "User",
      );
      setState(() {
        _isLoading = true;
      });
      var response = await SignUpUser.createPost(user);
      setState(() {
        _isLoading = false;
      });
      if (response is Success) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        print('error');
      }
    } else {
      print('error');
    }
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    var controlPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
