part of 'question.dart';

Question _$SerializeQuestionObjectFromJson(Map<String, dynamic> json) {
  return Question(
    question: json['question'] as String,
    status: json['status'] as String?,
    number: json['number'] as String?,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,

    id: json['id'] as int,
    parent_id: json['parent_id'] as int?,
    sort: json['sort'] as int?,
    is_validate: json['is_validate'] as int?,
    is_round: json['is_round'] as int?,
    is_osteoporosis: json['is_osteoporosis'] as int?,

    answer: json['answer'] == null
        ? null
        : ChoiceObject.fromJson(json['answer'] as Map<String, dynamic>),
    // final ChoiceObject? answer;

    choice: (json['choice'] as List<dynamic>)
        .map((e) => ChoiceObject.fromJson(e as Map<String, dynamic>))
        .toList(),
    // final List<ChoiceObject> choice;
  );
}

Map<String, dynamic> _$SerializeQuestionObjectToJson(Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parent_id,
      'question': instance.question,
      'status': instance.status,
      'number': instance.number,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'sort': instance.sort,
      'is_validate': instance.is_validate,
      'is_round': instance.is_round,
      'is_osteoporosis': instance.is_osteoporosis,
      'answer': instance.answer,
      'choice': instance.choice,
    };

QuestionList _$SerializeQuestionListFromJson(Map<String, dynamic> json) {
  return QuestionList(
    question: (json['question'] as List<dynamic>)
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
    // final List<ChoiceObject> choice;
  );
}

Map<String, dynamic> _$SerializeQuestionListToJson(QuestionList instance) =>
    <String, dynamic>{
      'question': instance.question,
    };
