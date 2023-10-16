import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Text(
        'Register Page',
        style: TextStyle(fontSize: 50, color: Color.fromRGBO(28, 22, 205, 1)),
      )),
    );
  }
}
