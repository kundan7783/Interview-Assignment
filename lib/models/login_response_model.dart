class LoginResponseModel {
  final bool success;
  final String message;
  final LoginData data;

  LoginResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'],
      message: json['message'],
      data: LoginData.fromJson(json['data']),
    );
  }
}

class LoginData {
  final LoginUser user;
  final String accessToken;

  LoginData({
    required this.user,
    required this.accessToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: LoginUser.fromJson(json['user']),
      accessToken: json['access_token'],
    );
  }
}

class LoginUser {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String phone;
  final String status;
  final String createdAt;
  final String updatedAt;

  LoginUser({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.phone,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
