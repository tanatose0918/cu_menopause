part of 'choice.dart';

ChoiceObject _$SerializeChoiceObjectFromJson(Map<String, dynamic> json) {
  return ChoiceObject(
    // int
    id: json['id'] as int,
    question_id: json['question_id'] as int,
    parent_id: json['parent_id'] as int?,
    point: json['point'] as int,
    sort: json['sort'] as int?,
    unit: json['unit'] as int?,
    is_disable: json['is_disable'] as int?,
    is_round: json['is_round'] as int?,

    // Double
    // aDouble: (json['aDouble'] as num?)?.toDouble(),

    // String
    choice: json['choice'] as String,
    type: json['type'] as String,
    status: json['status'] as String,
    number: json['number'] as String?,
    comment: json['comment'] as String?,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    auto_field: json['auto_field'] as String?,

    // List of Int
    // aListOfInts:
    //     (json['aListOfInts'] as List<dynamic>?)?.map((e) => e as int).toList(),

    // List of Double
    // aListOfDoubles: (json['aListOfDoubles'] as List<dynamic>?)
    //     ?.map((e) => (e as num).toDouble())
    //     .toList(),

    // List of String
    // aListOfStrings: (json['aListOfStrings'] as List<dynamic>?)
    //     ?.map((e) => e as String)
    //     .toList(),

    // List of Object
    sub_choice: (json['sub_choice'] as List<dynamic>?)
        ?.map((e) => ChoiceObject.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SerializeChoiceObjectToJson(ChoiceObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.question_id,
      'parent_id': instance.parent_id,
      'choice': instance.choice,
      'type': instance.type,
      'point': instance.point,
      'status': instance.status,
      'number': instance.number,
      'comment': instance.comment,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'sort': instance.sort,
      'unit': instance.unit,
      'auto_field': instance.auto_field,
      'is_disable': instance.is_disable,
      'is_round': instance.is_round,
      'sub_choice': instance.sub_choice,
    };
