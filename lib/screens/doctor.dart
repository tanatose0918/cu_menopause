import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: const Text(
        'Doctor Page',
        style: TextStyle(fontSize: 50, color: Color.fromRGBO(6, 99, 11, 1)),
      )),
    );
  }
}
