import 'package:flutter/material.dart';
import 'package:cu_menopause/data/entities/question.dart';
import 'package:cu_menopause/widgets/choice_widget.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget({super.key, required this.questionList});

  QuestionList questionList;

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    List<Question> question_list = questionList.question;
    for (var i = 0; i < question_list.length; i++) {
      if (question_list[i].choice!.isEmpty) {
        widgets.addAll([
          ConstrainedBox(
              constraints: const BoxConstraints(
                  maxWidth: 468, minHeight: 64, minWidth: 224),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textScaleFactor: 1.2,
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      text: question_list[i].number,
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(text: question_list[i].question),
                      ],
                    ),
                  ),
                  const Divider(
                      height: 40,
                      indent: 42,
                      endIndent: 42,
                      color: Color.fromARGB(255, 117, 17, 70)),
                ],
              )),
        ]);
      } else {
        widgets.addAll([
          ConstrainedBox(
              constraints: const BoxConstraints(
                  maxWidth: 468, minHeight: 64, minWidth: 224),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textScaleFactor: 1.2,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      text: question_list[i].number,
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(text: question_list[i].question),
                      ],
                    ),
                  ),
                  ChoiceWidget(choices: question_list[i].choice),
                ],
              )),
        ]);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
