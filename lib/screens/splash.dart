import 'package:flutter/material.dart';
// import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // var _timer = 0;

  // startSplash() {}

  // _count_time() async {}

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: const Text(
        'Splash Page',
        style: TextStyle(fontSize: 50, color: Color.fromRGBO(48, 217, 51, 1)),
      )),
    );
  }
}
