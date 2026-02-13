class RegisterResponseModel {
  final bool success;
  final String message;
  final SignupUserData data;

  RegisterResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: json['success'],
      message: json['message'],
      data: SignupUserData.fromJson(json['data']),
    );
  }
}

class SignupUserData {
  final String status;
  final int id;
  final String name;
  final String email;
  final String gender;
  final String phone;
  final String password;
  final String createdAt;
  final String updatedAt;

  SignupUserData({
    required this.status,
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.phone,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SignupUserData.fromJson(Map<String, dynamic> json) {
    return SignupUserData(
      status: json['status'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      password: json['password'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
