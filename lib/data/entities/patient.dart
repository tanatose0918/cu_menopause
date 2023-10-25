import 'package:cu_menopause/data/entities/mrs_form.dart';
import 'package:cu_menopause/data/entities/question.dart';

class Patient {
  const Patient({
    required this.mn_number,
    required this.the_time,
    this.disease,
    this.patient_form,
    this.mrs_form,
    this.nurse_form,
    this.physician_form,
  });
  final String mn_number;
  final int the_time;
  final List<String>? disease;
  final List<Question>? patient_form;
  final MrsForm? mrs_form;
  final List<Question>? nurse_form;
  final List<Question>? physician_form;
}
