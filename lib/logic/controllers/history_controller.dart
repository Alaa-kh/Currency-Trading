import 'package:currency_trading/model/history_model.dart';
import 'package:currency_trading/repo/history_repo.dart';
import 'package:get/get.dart';

abstract class HistoryController extends GetxController {
  Future<void> history();
}

class HistoryControllerImpl extends HistoryController {
  final HistoryRepositoryImpl _repository = HistoryRepositoryImpl();
  List<HistoryModel> historyMod = [];
  @override
  void onInit() {
    super.onInit();
    history();
  }

  @override
  Future<void> history() async {
    final result = await _repository.fetchHistory();
    if (result is List<HistoryModel>) {
      historyMod=result;
      print('====================== alaa');
    } else {
      await history();
    }
    update();
  }
}
