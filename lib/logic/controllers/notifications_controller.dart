import 'package:currency_trading/model/notifications_model.dart';
import 'package:currency_trading/repo/notifications_repo.dart';
import 'package:get/get.dart';



abstract class NotificationsController extends GetxController {
  Future<void> notifications();
}


class NotificationsControllerImpl extends NotificationsController {
  final NotificationsRepositoryImpl _repository = NotificationsRepositoryImpl();
 NotificationsModel? notificationsModel;
  int page = 1;
  bool isLoadingMore = false;
  @override
  void onInit() {
    super.onInit();
    notifications();
  }

  @override
  Future<void> notifications() async {
    final result = await _repository.fetchNotifications(page);
    if (result is NotificationsModel) {
notificationsModel = result;
      // notificationsModel.add(result);
      // if(result.meta.total<notificationsModel.length){
      //   page+=1;
      //   isLoadingMore = true;

      // }
      print('======================succcus notifications');
      // print('-------------------------- ${notificationsModel.length}');
    } else {
      await notifications();
    }
    update();
  }
}