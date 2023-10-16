import 'package:flutter/material.dart';

import 'package:cu_menopause/screens/doctor.dart';
import 'package:cu_menopause/screens/home.dart';
import 'package:cu_menopause/screens/login.dart';
import 'package:cu_menopause/screens/mrs.dart';
import 'package:cu_menopause/screens/nurse.dart';
import 'package:cu_menopause/screens/patient.dart';
import 'package:cu_menopause/screens/register.dart';
import 'package:cu_menopause/screens/splash.dart';

void main() async {
  runApp(CUMenopauseApp());
}

class CUMenopauseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CU Menopause',
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const Splash(),
        '/login': (BuildContext context) => const Login(),
        '/home': (BuildContext context) => const HomeScreen(),
        '/register': (BuildContext context) => const Register(),
        '/patient': (BuildContext context) => const Patient(),
        '/mrs': (BuildContext context) => const Mrs(),
        '/nurse': (BuildContext context) => const Nurse(),
        '/doctor': (BuildContext context) => const Doctor(),
      },
    );
  }
}

// Container(
//           child: HomeScreen(),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/BG.jpeg"),
//               fit: BoxFit.cover,
//             ),
//           )),