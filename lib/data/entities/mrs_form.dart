import 'package:cu_menopause/data/entities/question.dart';

class MrsForm {
  const MrsForm(
      {required this.mn_number, required this.the_time, required this.form});
  final String mn_number;
  final int the_time;
  final List<Question> form;
}
