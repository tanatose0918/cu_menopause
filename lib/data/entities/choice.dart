class Choice {
  const Choice({
    required this.id,
    required this.question_id,
    this.parent_id,
    required this.choice,
    required this.type,
    required this.point,
    required this.status,
    this.number,
    this.comment,
    required this.created_at,
    required this.updated_at,
    this.sort,
    this.unit,
    this.auto_field,
    this.is_disable,
    this.is_round,
  });

  final int id;
  final int question_id;
  final int? parent_id;
  final String choice;
  final String type;
  final int point;
  final String status;
  final String? number;
  final String? comment;
  final String created_at;
  final String updated_at;
  final int? sort;
  final int? unit;
  final String? auto_field;
  final int? is_disable;
  final int? is_round;
}
