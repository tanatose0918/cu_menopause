import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Material(
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/BG.jpeg"),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/logo.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 117, 17, 70)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(120, 20, 120,
                      20), // EdgeInsets.fromLTRB(140, 20, 140, 20)
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
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
                        TextFormField(
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
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Text('จำรหัสผ่าน')
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Map<String, dynamic> args = {
                                "msg": 'Hello somethings'
                              };
                              Navigator.pushNamed(context, '/home',
                                  arguments: args);
                            },
                            child: const Text('เข้าสู่ระบบ'))
                      ],
                    ),
                  )),
            ]),
          )),
    );
  }
}
