class Question {
  const Question({
    required this.id,
    required this.parent_id,
    required this.question,
    this.status,
    this.number,
    required this.created_at,
    required this.updated_at,
    required this.sort,
    required this.is_validate,
    required this.is_round,
    required this.is_osteoporosis,
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
}
