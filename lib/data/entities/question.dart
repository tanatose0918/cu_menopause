import 'package:json_annotation/json_annotation.dart';
import 'package:cu_menopause/data/entities/choice.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  const Question({
    required this.id,
    this.parent_id,
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
    this.choice,
  });

  final int id;
  final int? parent_id;
  final String question;
  final String? status;
  final String? number;
  final String created_at;
  final String updated_at;
  final int? sort;
  final int? is_validate;
  final int? is_round;
  final int? is_osteoporosis;
  final ChoiceObject? answer;
  final List<ChoiceObject>? choice;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$SerializeQuestionObjectFromJson(json);

  Map<String, dynamic> toJson() => _$SerializeQuestionObjectToJson(this);
}

@JsonSerializable()
class QuestionList {
  const QuestionList({required this.question});
  final List<Question> question;

  factory QuestionList.fromJson(Map<String, dynamic> json) =>
      _$SerializeQuestionListFromJson(json);

  Map<String, dynamic> toJson() => _$SerializeQuestionListToJson(this);
}
