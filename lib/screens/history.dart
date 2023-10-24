import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cu_menopause/data/model/user_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  String showMnNumber = UserModel().mnNumber;
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
            automaticallyImplyLeading: true,
            toolbarHeight: 200,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leadingWidth: 100,
            leading: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: const Color.fromARGB(255, 123, 123, 124),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'ADMIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 117, 17, 70)),
                    ),
                  ),
                  Tooltip(
                    message: 'MN${context.watch<UserModel>().mnNumber}',
                    child: Text(
                      'MN${context.watch<UserModel>().mnNumber}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 117, 17, 70)),
                    ),
                  )
                ],
              ),
            ),
            centerTitle: true,
            title: SizedBox(
              child: Image.asset('assets/images/logo.png'),
              height: 200,
              width: 200,
            ),
          ),
          endDrawer: Drawer(
            child: ListView(children: [
              const ListTile(),
              ListTile(
                title: Text('ค้นหาประวัติคนไข้'),
                onTap: () {
                  context.read<UserModel>().setMnNumber('');
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              ListTile(
                title: Text('ลงชื่อออก'),
                onTap: () {
                  context.read<UserModel>().reset();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              )
            ]),
          ),
          body: Column(children: []),
        ),
      ],
    ));
  }
}
