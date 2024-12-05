import 'package:currency_trading/model/results_model.dart';
import 'package:currency_trading/repo/results_repo.dart';
import 'package:get/get.dart';

abstract class ResultsController extends GetxController {
  Future<void> results();
}

class ResultsControllerImpl extends ResultsController {
  final ResultsRepositoryImpl _repository = ResultsRepositoryImpl();
  ResultsModel? resultsModel;
  @override
  void onInit() {
    super.onInit();
    results();
  }

  @override
  Future<void> results() async {
    final result = await _repository.results();
    if (result is ResultsModel) {
      resultsModel = result;
      print('======================succcus');
    } else {
      await results();
    }
    update();
  }
}
