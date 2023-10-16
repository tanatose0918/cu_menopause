import 'package:flutter/material.dart';

import 'package:cu_menopause/ui/screens/mrs/mrs.dart';
import 'package:cu_menopause/ui/screens/nurse/nurse.dart';
import 'package:cu_menopause/ui/screens/patient/patient.dart';
import 'package:cu_menopause/ui/screens/register/register.dart';
import 'package:cu_menopause/ui/screens/login/login.dart';
import 'package:cu_menopause/ui/screens/splash/splash.dart';
import 'package:cu_menopause/ui/screens/home/home.dart';

void main() async {
  runApp(CUMenopauseApp());
}

class CUMenopauseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CU Menopause',
      home: Container(
          child: HomeScreen(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/BG.jpeg"),
              fit: BoxFit.cover,
            ),
          )),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const Splash(),
        '/login': (BuildContext context) => const Login(),
        '/register': (BuildContext context) => const Register(),
        '/patient': (BuildContext context) => const Patient(),
        '/mrs': (BuildContext context) => const Mrs(),
        '/nurse': (BuildContext context) => const Nurse(),
        '/doctor': (BuildContext context) => const Login(),
      },
    );
  }
}
