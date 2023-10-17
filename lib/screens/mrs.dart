import 'package:flutter/material.dart';

class Mrs extends StatefulWidget {
  const Mrs({Key? key}) : super(key: key);

  @override
  _MrsState createState() => _MrsState();
}

class _MrsState extends State<Mrs> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: const Text(
        'MRS Page',
        style: TextStyle(fontSize: 50, color: Color.fromRGBO(50, 91, 202, 1)),
      )),
    );
  }
}
