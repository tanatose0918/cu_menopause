import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Form(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(140, 20, 140, 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'ชื่อผู้ใช้',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(140, 20, 140, 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'รหัสผ่าน',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
        ]),
      )),
    );
  }
}
