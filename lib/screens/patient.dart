import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Text(
        'Patient Page',
        style: TextStyle(fontSize: 50, color: Color.fromRGBO(147, 45, 138, 1)),
      )),
    );
  }
}
