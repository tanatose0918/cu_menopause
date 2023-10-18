import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cu_menopause/screens/doctor.dart';
import 'package:cu_menopause/screens/home.dart';
import 'package:cu_menopause/screens/login.dart';
import 'package:cu_menopause/screens/mrs.dart';
import 'package:cu_menopause/screens/nurse.dart';
import 'package:cu_menopause/screens/patient.dart';
import 'package:cu_menopause/screens/register.dart';
import 'package:cu_menopause/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(MultiRepositoryProvider(providers: const [], child: const CUMenopauseApp()));
  runApp(const CUMenopauseApp());
}

class CUMenopauseApp extends StatelessWidget {
  const CUMenopauseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CU Menopause',
      initialRoute: '/login',
      theme: ThemeData(
          fontFamily: 'ChulaCharas',
          useMaterial3: true,
          colorSchemeSeed: Color.fromARGB(255, 68, 10, 97)),
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
