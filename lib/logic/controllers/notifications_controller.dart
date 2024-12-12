import 'package:currency_trading/model/notifications_model.dart';
import 'package:currency_trading/repo/notifications_repo.dart';
import 'package:get/get.dart';

abstract class NotificationsController extends GetxController {
  Future<void> notifications();
}

class NotificationsControllerImpl extends NotificationsController {
  final NotificationsRepositoryImpl _repository = NotificationsRepositoryImpl();
  NotificationsModel? notificationsModel;
  List<NotificationData> notificationItems = [];

  int page = 1;
  bool isLoadingMore = false;
  bool hasMoreNotifi = true;
  @override
  void onInit() {
    super.onInit();
    notifications();
  }

  @override
  Future<void> notifications() async {
    print('asdasd');
    if (!hasMoreNotifi) {
      return;
    }
    if (notificationItems.isNotEmpty) {
      isLoadingMore = true;
    }
    update();
    final result = await _repository.fetchNotifications(page);
    if (result is NotificationsModel) {
      notificationsModel = result;
      notificationItems.addAll(result.data);
      if (notificationItems.length < notificationsModel!.meta.total) {
        page += 1;
      } else {
        hasMoreNotifi = false;
      }
      print('======================succcus notifications');
      // print('-------------------------- ${notificationsModel.length}');
    }
    // else {
    //   await notifications();
    // }
    update();
  }
}
