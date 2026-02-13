class RegisterRequestModel {
  final String name;
  final String email;
  final String gender;
  final String phone;
  final String password;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "gender": gender,
      "phone": phone,
      "password": password,
    };
  }
}
