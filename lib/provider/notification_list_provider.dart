import 'package:flutter/cupertino.dart';
import 'package:interview_assignment/models/dealer_notification_list_response_model.dart';
import 'package:interview_assignment/services/notification_list_api_service.dart';

class NotificationListProvider extends ChangeNotifier {

  DealerNotificationListResponseModel? notificationModel;
  bool isNotificationLoading = false;

  Future<void> getNotifications() async {

    isNotificationLoading = true;
    notifyListeners();

    final response =
    await NotificationListApiService.getNotificationList();

    if (response != null) {
      notificationModel = response;
    }

    isNotificationLoading = false;
    notifyListeners();
  }
}
