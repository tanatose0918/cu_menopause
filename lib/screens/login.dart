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
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/BG.jpeg"),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('เข้าสู่ระบบ'),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(120, 20, 120,
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
                            Text('จำรหัสผ่าน')
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
                            child: Text('เข้าสู่ระบบ'))
                      ],
                    ),
                  )),
            ]),
          )),
    );
  }
}

// Container(
//       child: HomeScreen(),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/images/BG.jpeg"),
//           fit: BoxFit.cover,
//         ),
//       )),

// Center(
//           child: Form(
//     child: Column(children: [
//       Padding(
//         padding: EdgeInsets.fromLTRB(
//             140, 20, 140, 20), // EdgeInsets.fromLTRB(140, 20, 140, 20)
//         child: TextFormField(
//           decoration: const InputDecoration(
//             labelText: 'ชื่อผู้ใช้',
//           ),
//           validator: (String? value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter some text';
//             }
//             return null;
//           },
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.fromLTRB(140, 20, 140, 20),
//         child: TextFormField(
//           decoration: const InputDecoration(
//             labelText: 'รหัสผ่าน',
//           ),
//           validator: (String? value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter some text';
//             }
//             return null;
//           },
//         ),
//       ),
//     ]),
//   ))
