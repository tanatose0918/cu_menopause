import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cu_menopause/data/entities/user.dart';
// import 'package:cu_menopause/data/network_data.dart';
// import 'package:cu_menopause/ui/screens/home/sections/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _userInfo;

  void getAllUsers() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var firstUser = jsonResponse[0]['name'];
      print('can get User data: $firstUser');
      // this._userInfo = jsonResponse[0];
      // var itemCount = jsonResponse['totalItems'];
      // print('can get User data: $jsonResponse');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/BG.jpeg"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Container()),
                  Text(
                    'ADMIN',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 117, 17, 70)),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Expanded(flex: 1, child: Container()),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('ออกจากระบบ')),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
              Expanded(flex: 1, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'MN - ',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 117, 17, 70)),
                  )
                ],
              ),
              Expanded(flex: 1, child: Container()),
              ElevatedButton(
                  onPressed: () => getAllUsers(),
                  child: const Text('call Api')),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ));
  }
}
