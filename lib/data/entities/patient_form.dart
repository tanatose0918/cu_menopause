class GeneralForm {}

class PatientForm {
  const PatientForm({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phone;
}
