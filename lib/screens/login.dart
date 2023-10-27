import 'package:cu_menopause/data/entities/user.dart';
import 'package:cu_menopause/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  bool isShowLoginInfo = false;

  String showUsername = UserModel().username;
  String showPassword = UserModel().password;

// Form Controller --------------------------------------------------
  final _loginForm = GlobalKey<FormState>();

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    _username.text = 'admin';
    _password.text = '123456789';
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  // void changeShowInfo() {
  //   if (!isShowLoginInfo) {
  //     isShowLoginInfo = true;
  //   } else {
  //     isShowLoginInfo = false;
  //   }
  // }

  reset() {
    _username.text = '';
    _password.text = '';
  }

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
                  padding: const EdgeInsets.all(
                      26), // EdgeInsets.fromLTRB(140, 20, 140, 20)
                  child: SingleChildScrollView(
                    child: Form(
                      key: _loginForm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            width: 284,
                            child: const Text('ชื่อผู้ใช้',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxHeight: 72,
                                maxWidth: 284,
                                minHeight: 20,
                                minWidth: 124),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: _username,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(fontSize: 14),
                                contentPadding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            width: 284,
                            child: const Text('รหัสผ่าน',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: _password,
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(fontSize: 14),
                              contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              constraints: BoxConstraints(
                                  maxHeight: 72,
                                  maxWidth: 284,
                                  minHeight: 36,
                                  minWidth: 124),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            width: 284,
                            child: Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  'จำรหัสผ่าน',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36,
                            child: ElevatedButton(
                                onPressed: () {
                                  var valid =
                                      _loginForm.currentState!.validate();
                                  if (!valid) {
                                    return;
                                  }
                                  context
                                      .read<UserModel>()
                                      .setLogin(_username.text, _password.text);
                                  if (context.read<UserModel>().getLogin()) {
                                    Navigator.pushNamed(context, '/home');
                                  } else {
                                    reset();
                                  }
                                },
                                child: const Text(
                                  'เข้าสู่ระบบ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(flex: 1, child: Container()),
              TextButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    context.read<UserModel>().checkForgotPassword();
                    // changeShowInfo();
                  },
                  child: const Text(
                    'ลืมรหัสผ่าน',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ))
            ]),
          )),
    );
  }
}
