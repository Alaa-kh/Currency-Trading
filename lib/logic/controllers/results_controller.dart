import 'package:currency_trading/model/results_model.dart';
import 'package:currency_trading/repo/notifications_repo.dart';
import 'package:get/get.dart';

abstract class ResultsController extends GetxController {
  Future<void> results();
}

class ResultsControllerImpl extends ResultsController {
  final NotificationsRepositoryImpl _repository = NotificationsRepositoryImpl();
  ResultsModel? resultsModel;
  @override
  void onInit() {
    super.onInit();
    results();
  }

  @override
  Future<void> results() async {
    final result = await _repository.fetchNotifications();
    if (result is ResultsModel) {
      resultsModel = result;
      print('======================succcus');
    } else {
      await results();
    }
    update();
  }
}
