import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cu_menopause/data/model/patient_model.dart';
import 'package:cu_menopause/data/entities/question.dart';
import 'package:cu_menopause/widgets/question_widget.dart';

var form_1_url = Uri.http('13.214.166.31', '/api/question');

class PatientForm1 extends StatefulWidget {
  static String routeName = '/patient/form_1';
  const PatientForm1({Key? key}) : super(key: key);

  @override
  _PatientForm1State createState() => _PatientForm1State();
}

class _PatientForm1State extends State<PatientForm1> {
  final _patient_form_1 = GlobalKey<FormState>();

  late QuestionList question_list;

  @override
  void initState() {
    getQuestions();
    super.initState();
  }

  Future<QuestionList> getQuestions() async {
    var response = await http.get(form_1_url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      question_list = QuestionList.fromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return question_list;
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
              toolbarHeight: 172,
              // elevation: 1,
              backgroundColor: Colors.transparent,
              leadingWidth: 106,
              leading: const SizedBox(
                  height: 56,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            'ADMIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 117, 17, 70)),
                          ),
                        ),
                      ],
                    ),
                  )),
              title: SizedBox(
                child: Image.asset('assets/images/logo.png'),
                height: 162,
                width: 162,
              ),
            ),
            endDrawer: Drawer(
              child: ListView(children: [
                const ListTile(),
                ListTile(
                  title: const Text('ค้นหาประวัติคนไข้'),
                  onTap: () {
                    context.read<PatientModel>().setMnNumber('');
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                ListTile(
                  title: Text('ลงชื่อออก'),
                  onTap: () {
                    context.read<PatientModel>().reset();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                )
              ]),
            ),
            body: SingleChildScrollView(
                child: Center(
                    child: Form(
              key: _patient_form_1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'แบบบันทึกข้อมูลคลินิกวัยทอง ส.ธ. 4 ครั้งแรก',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 117, 17, 70)),
                    ),
                  ),
                  const Text(
                    '(1st Visit Case Record Form for Menopause Registry Project)',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 117, 17, 70)),
                  ),
                  const Divider(
                      height: 40,
                      indent: 42,
                      endIndent: 42,
                      color: Color.fromARGB(255, 117, 17, 70)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: FutureBuilder<QuestionList>(
                      future: getQuestions(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print('data ERROR!!!!!!!!!!!!');

                          return const Center(
                            child: Text('An error has occurred!'),
                          );
                        } else if (snapshot.hasData) {
                          print('is has data!');
                          return QuestionWidget(questionList: question_list);
                        } else {
                          print('is pending...');
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('ก่อนหน้า')),
                      ElevatedButton(
                          onPressed: () {
                            getQuestions();
                            // var valid = _patient_form_1.currentState!.validate();
                            // if (!valid) {
                            //   return;
                            // }
                            // context.read<UserModel>().setMnNumber(_mnNumber.text);
                            // if (context.read<UserModel>().checkMnNumber()) {
                            //   _mnNumber.text = '';
                            //   Navigator.pushNamed(context, '/home/history');
                            // }
                          },
                          child: Text('ถัดไป'))
                    ],
                  ),
                ],
              ),
            ))),
          ),
        ],
      ),
    );
  }
}
