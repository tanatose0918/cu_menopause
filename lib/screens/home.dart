import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cu_menopause/data/entities/user.dart';
// import 'package:cu_menopause/data/network_data.dart';
// import 'package:cu_menopause/ui/screens/home/sections/login.dart';

var _starwarAPI_people = Uri.http('swapi.dev', '/api/people');
var _starwarAPI_planets = Uri.http('swapi.dev', '/api/planets');
var _starwarAPI_films = Uri.http('swapi.dev', '/api/films');
var _starwarAPI_species = Uri.http('swapi.dev', '/api/species');
var _starwarAPI_vehicles = Uri.http('swapi.dev', '/api/vehicles');
var _starwarAPI_starships = Uri.http('swapi.dev', '/api/starships');

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _userInfo;

  final _searchingMnNumberForm = GlobalKey<FormState>();
  final _mnNumber = TextEditingController();

  void getAllUsers() async {
    var response = await http.get(_starwarAPI_people);
    // print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var people = jsonResponse['results'];
      print('can get User data: $people ');
      // this._userInfo = jsonResponse[0];
      // var itemCount = jsonResponse['totalItems'];
      // print('can get User data: $jsonResponse');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                    const Text(
                      'ADMIN',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 117, 17, 70)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('ออกจากระบบ')),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'ค้นหาประวัติคนไข้',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 117, 17, 70)),
                  ),
                ),
                Form(
                  key: _searchingMnNumberForm,
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'MN - ',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 117, 17, 70)),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxHeight: 72,
                              maxWidth: 284,
                              minHeight: 20,
                              minWidth: 124),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: _mnNumber,
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
                        // Builder(builder: (widget)=>)
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => getAllUsers(),
                    child: const Text('call Api')),
              ],
            ),
          )),
    );
  }
}
