import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interview_assignment/constant/api_url.dart';
import 'package:interview_assignment/models/dealer_notification_list_response_model.dart';
import '../utils/token_storage_service.dart';

class NotificationListApiService {
  static Future<DealerNotificationListResponseModel?> getNotificationList({String? type, String? category, String? language, int skip = 0, int take = 10,}) async {
    try {
      final token = await TokenStorageService.getToken();

      final response = await http.post(
        Uri.parse("$apiUrl/api/dealer-notification-list"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "type": type,
          "category": category,
          "language": language,
          "skip": skip,
          "take": take,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return DealerNotificationListResponseModel.fromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
