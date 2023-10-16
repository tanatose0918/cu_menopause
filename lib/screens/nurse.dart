import 'package:flutter/material.dart';

class Nurse extends StatefulWidget {
  const Nurse({Key? key}) : super(key: key);

  @override
  _NurseState createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Text(
        'Nurse Page',
        style: TextStyle(fontSize: 50, color: Color.fromRGBO(150, 11, 11, 1)),
      )),
    );
  }
}
