import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cu_menopause/data/model/user_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

const List<String> list = <String>[
  'แสดงทั้งหมด',
  'แบบบันทึกครั้งแรก',
  'สุขภาพดี',
  'รักษากระดูกพรุน',
  'รักษาฮอร์โมน'
];

class _HistoryState extends State<HistoryScreen> {
  String showMnNumber = UserModel().mnNumber;
  String dropdownValue = list.first;

  final _searchingWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color.fromRGBO(170, 109, 185, 1);
      }
      return Colors.white;
    }

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
            centerTitle: true,
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
          body: Center(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'ประวัติการรักษา',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 117, 17, 70)),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxHeight: 72,
                          maxWidth: 262,
                          minHeight: 20,
                          minWidth: 238),
                      child: TextFormField(
                        controller: _searchingWord,
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
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: DropdownMenu<String>(
                    initialSelection: list.first,
                    menuStyle: MenuStyle(
                        surfaceTintColor:
                            MaterialStateProperty.resolveWith(getColor),
                        backgroundColor:
                            MaterialStateProperty.resolveWith(getColor)),
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
              ])
            ]),
          ),
        ),
      ],
    ));
  }
}
