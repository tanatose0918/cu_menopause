import 'package:cu_menopause/data/entities/choice.dart';
import 'package:flutter/material.dart';
import 'package:cu_menopause/widgets/date_picker_widget.dart';

class ChoiceWidget extends StatefulWidget {
  ChoiceWidget({super.key, this.choices});
  List<ChoiceObject>? choices;

  @override
  _ChoiceWidgetState createState() => _ChoiceWidgetState();
}

class _ChoiceWidgetState extends State<ChoiceWidget> {
  @override
  Widget build(BuildContext context) {

  

    if (widget.choices!.isEmpty) {
      print('this question is empty choices');
    } else {
      for (int i = 0; i < widget.choices!.length; i++) {
        print(widget.choices![i].choice);
      }
    }

    return Container(
        height: 20,
        width: 20,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 3)));
    // if (type == 'input_birth') {
    //   return Container(
    //     margin: EdgeInsets.all(20),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         border: Border.all(color: Colors.purple, width: 2)),
    //     child: DatePickerWidget(),
    //   );
    // } else if (widget.type == 'input_year_age') {
    //   return Container();
    // } else if (widget.type == 'year_be') {
    //   return Container();
    // } else if (widget.type == 'month_be') {
    //   return Container();
    // } else if (widget.type == 'radio') {
    //   return Container();
    // } else if (widget.type == 'radio_etc') {
    //   return Container();
    // } else if (widget.type == 'input_text') {
    //   return Container();
    // } else {
    //   print('in type nothings');
    //   return Container(
    //     child: Column(children: []),
    //   );
    // }
  }
}
