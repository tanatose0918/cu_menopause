import 'package:flutter/material.dart';

// import 'package:cu_menopause/ui/screens/home/sections/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/BG.jpeg"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text('ADMIN'),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('ออกจากระบบ'))
                ],
              ),
              Form(
                child: Row(
                  children: [
                    Text('MN - '),
                    // TextFormField(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
