class User {
  const User(
      {required this.username,
      required this.password,
      this.nurse_id,
      this.nurse_name,
      this.physician_id,
      this.physician_name});

  final String username;
  final String password;
  final String? nurse_id;
  final String? nurse_name;
  final String? physician_id;
  final String? physician_name;
}
