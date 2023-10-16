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
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset('assets/images/logo.png'),
          ),
          Container(
            // child: Login(),
          ),
        ],
      ),
    );
  }
}
