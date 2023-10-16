import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Text(
        'Splash Page',
        style: TextStyle(fontSize: 50, color: Color.fromRGBO(48, 217, 51, 1)),
      )),
    );
  }
}
