import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:kwilox_/screens/login.dart';

import 'package:page_transition/page_transition.dart';

@override
Widget build(BuildContext context) {
  return MaterialApp();
  home: const SplashScreen();
}


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/logo.png'),
          // const Text('Kwilox Relaxation Center'),
        ],
        
      ),
      backgroundColor: Colors.white,
      nextScreen:const LoginPage(),
      splashIconSize: 500,
      duration:4000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType:PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 10),
      );
  }
}