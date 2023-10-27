import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cu_menopause/data/entities/user.dart';
// import 'package:cu_menopause/data/network_data.dart';
// import 'package:cu_menopause/ui/screens/home/sections/login.dart';

import 'package:cu_menopause/data/model/user_model.dart';

// ==============================================================================
//          Test to call the public api
var _starwarAPI_people = Uri.http('swapi.dev', '/api/people');
var _starwarAPI_planets = Uri.http('swapi.dev', '/api/planets');
var _starwarAPI_films = Uri.http('swapi.dev', '/api/films');
var _starwarAPI_species = Uri.http('swapi.dev', '/api/species');
var _starwarAPI_vehicles = Uri.http('swapi.dev', '/api/vehicles');
var _starwarAPI_starships = Uri.http('swapi.dev', '/api/starships');

// ==============================================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _userInfo;

  final _searchingMnNumberForm = GlobalKey<FormState>();
  final _mnNumber = TextEditingController();

  @override
  void dispose() {
    _mnNumber.dispose();
    super.dispose();
  }

  void getAllUsers() async {
    var response = await http.get(_starwarAPI_people);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var people = jsonResponse['results'];
      print('can get User data: $people ');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/BG.jpeg"),
            fit: BoxFit.cover,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 200,
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leadingWidth: 100,
            leading: const Center(
              child: Text(
                'ADMIN',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 117, 17, 70)),
              ),
            ),
            title: SizedBox(
              child: Image.asset('assets/images/logo.png'),
              height: 200,
              width: 200,
            ),
          ),
          endDrawer: Drawer(
            child: ListView(children: [
              ListTile(),
              ListTile(
                title: Text('ค้นหาประวัติคนไข้'),
                onTap: () {
                  context.read<UserModel>().setMnNumber('');
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              ListTile(
                title: Text(
                  'ลงชื่อออก',
                ),
                onTap: () {
                  context.read<UserModel>().reset();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              )
            ]),
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'ค้นหาประวัติคนไข้',
                  style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 117, 17, 70)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Menopause Number',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 117, 17, 70)),
                ),
              ),
              Form(
                key: _searchingMnNumberForm,
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                            maxWidth: 200,
                            minHeight: 20,
                            minWidth: 124),
                        child: TextFormField(
                          controller: _mnNumber,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(fontSize: 14),
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 4, 2),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill MN-Number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      var valid =
                          _searchingMnNumberForm.currentState!.validate();

                      if (!valid) {
                        return;
                      }
                      context.read<UserModel>().setMnNumber(_mnNumber.text);
                      _mnNumber.text = '';

                      if (context.read<UserModel>().checkMnNumber()) {
                        Navigator.pushNamed(context, '/home/history');
                      }
                    },
                    child: const Text('ค้นหา')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('หรือ '),
                  TextButton(
                      style: const ButtonStyle(),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'ลงทะเบียนที่นี่',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    )

        // )
        );
  }
}
