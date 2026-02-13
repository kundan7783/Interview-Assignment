class DealerNotificationListResponseModel {
  final bool success;
  final String message;
  final UserData data;

  DealerNotificationListResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DealerNotificationListResponseModel.fromJson(Map<String, dynamic> json) {
    return DealerNotificationListResponseModel(
      success: json['success'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String profileImage;
  final String gender;
  final String phone;
  final int status;
  final List<NotificationData> notificationData;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.gender,
    required this.phone,
    required this.status,
    required this.notificationData,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profile_image'],
      gender: json['gender'],
      phone: json['phone'],
      status: json['status'],
      notificationData: List<NotificationData>.from(
        json['notification_data']
            .map((x) => NotificationData.fromJson(x)),
      ),
    );
  }
}

class NotificationData {
  final int id;
  final String title;
  final String description;
  final String? image;
  final String type;
  final String language;
  final String category;
  final String status;
  final String createdAt;
  final String updatedAt;
  final Country country;

  NotificationData({
    required this.id,
    required this.title,
    required this.description,
    this.image,
    required this.type,
    required this.language,
    required this.category,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.country,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      type: json['type'],
      language: json['language'],
      category: json['category'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      country: Country.fromJson(json['country']),
    );
  }
}

class Country {
  final int id;
  final String name;
  final StateData state;

  Country({
    required this.id,
    required this.name,
    required this.state,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      state: StateData.fromJson(json['state']),
    );
  }
}

class StateData {
  final int id;
  final String name;
  final District district;

  StateData({
    required this.id,
    required this.name,
    required this.district,
  });

  factory StateData.fromJson(Map<String, dynamic> json) {
    return StateData(
      id: json['id'],
      name: json['name'],
      district: District.fromJson(json['district']),
    );
  }
}

class District {
  final int id;
  final String name;
  final City city;

  District({
    required this.id,
    required this.name,
    required this.city,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      name: json['name'],
      city: City.fromJson(json['city']),
    );
  }
}

class City {
  final int id;
  final String name;
  final PinCode pinCode;

  City({
    required this.id,
    required this.name,
    required this.pinCode,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      pinCode: PinCode.fromJson(json['pin_code']),
    );
  }
}

class PinCode {
  final int id;
  final String name;

  PinCode({
    required this.id,
    required this.name,
  });

  factory PinCode.fromJson(Map<String, dynamic> json) {
    return PinCode(
      id: json['id'],
      name: json['name'],
    );
  }
}
