import 'package:flutter/material.dart';
import 'package:cu_menopause/ui/screens/home/home.dart';

void main() async {
  runApp(CUMenopauseApp());
}

// ส่วนของ Stateless widget
class CUMenopauseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CU Menopause',
      home: Home(),
    );
  }
}
