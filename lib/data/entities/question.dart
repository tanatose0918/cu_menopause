import 'package:cu_menopause/data/entities/choice.dart';

class Question {
  const Question({
    required this.id,
    required this.parent_id,
    required this.question,
    this.status,
    this.number,
    required this.created_at,
    required this.updated_at,
    this.sort,
    this.is_validate,
    this.is_round,
    this.is_osteoporosis,
    this.answer,
    required this.choice,
  });

  final int id;
  final int parent_id;
  final String question;
  final String? status;
  final String? number;
  final String created_at;
  final String updated_at;
  final int? sort;
  final int? is_validate;
  final int? is_round;
  final int? is_osteoporosis;
  final Choice? answer;
  final List<Choice> choice;
}
