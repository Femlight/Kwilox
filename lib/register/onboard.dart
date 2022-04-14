import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kwilox_/screens/login.dart';
import 'package:kwilox_/screens/registerScreen.dart';

class Screen1 extends StatelessWidget {
  const Screen1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
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
                          "KWILOX",
                          style: TextStyle(
                              letterSpacing: 12,
                              fontSize: 38,
                              color: Colors.white,
                              fontFamily: "oleoScript",
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
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
          const Spacer(),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(321, 51.91),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: "colfax",
                    ),
                    primary: Colors.white,
                    onPrimary: const Color(0xFFB23F3F),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 105, vertical: 17)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                child: const Text('Get Started')),
          ),
          const SizedBox(height: 30),
          Container(
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
                    side: const BorderSide(width: 1, color: Colors.white),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 105, vertical: 17)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text('Login')),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

// class MyClipper extends CustomClipper<Path> {
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
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
