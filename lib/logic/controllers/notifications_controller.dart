import 'package:currency_trading/model/notifications_model.dart';
import 'package:currency_trading/repo/notifications_repo.dart';
import 'package:get/get.dart';

abstract class NotificationsController extends GetxController {
  Future<void> notifications();
}

class NotificationsControllerImpl extends NotificationsController {
  final NotificationsRepositoryImpl _repository = NotificationsRepositoryImpl();
  NotificationsModel? notificationsModel;
  @override
  void onInit() {
    super.onInit();
    notifications();
  }

  @override
  Future<void> notifications() async {
    final result = await _repository.fetchNotifications();
    if (result is NotificationsModel) {
      notificationsModel = result;
      print('======================succcus');
    } else {
      await notifications();
    }
    update();
  }
}
