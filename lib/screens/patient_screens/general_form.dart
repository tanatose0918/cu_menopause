import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:cu_menopause/data/model/patient_model.dart';

class GeneralForm extends StatefulWidget {
  const GeneralForm({Key? key}) : super(key: key);

  @override
  _GeneralFormState createState() => _GeneralFormState();
}

class _GeneralFormState extends State<GeneralForm> {
  String routeName = '/form_1';

  final _registerForm = GlobalKey<FormState>();
  final _mnNumber = TextEditingController();

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
              elevation: 0,
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
                        // Consumer<UserModel>(
                        //   builder: (context, userModel, child) {
                        //     return Text('${userModel.mnNumber}');
                        //   },
                        // ),
                      ],
                    ),
                  )),
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
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'แบบบันทึกข้อมูลคลินิกวัยทอง ส.ธ. 4 ครั้งแรก',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 117, 17, 70)),
                    ),
                  ),
                  Text(
                    '(1st Visit Case Record Form for Menopause Registry Project)',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 117, 17, 70)),
                  ),
                  Text(
                    'ลงทะเบียนคนไข้ใหม่',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 117, 17, 70)),
                  ),
                  Divider(
                      height: 56,
                      indent: 42,
                      endIndent: 42,
                      color: Color.fromARGB(255, 117, 17, 70)),
                  Text(
                    'Menopause Number',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 117, 17, 70)),
                  ),
                  Form(
                    key: _registerForm,
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 2, 4, 2),
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
                  ElevatedButton(
                      onPressed: () {
                        var valid = _registerForm.currentState!.validate();
                        if (!valid) {
                          return;
                        }
                        // context.read<UserModel>().setMnNumber(_mnNumber.text);
                        // if (context.read<UserModel>().checkMnNumber()) {
                        //   _mnNumber.text = '';
                        //   Navigator.pushNamed(context, '/home/history');
                        // }
                      },
                      child: Text('ถัดไป'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
