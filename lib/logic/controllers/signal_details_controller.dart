import 'package:currency_trading/model/signals/signal_details_model.dart';
import 'package:currency_trading/repo/signals/signal_details_repo.dart';
import 'package:get/get.dart';

abstract class SignalDetailsController extends GetxController {
  Future<void> signalsDetails();
}

class SignalDetailsControllerImpl extends SignalDetailsController {
  SignalDetailsModel? signalDetailsModel;
  final SignalDetailsRepositoryImpl _repository = SignalDetailsRepositoryImpl();

  int id = Get.arguments['id'];
  
  @override
  void onInit() {
    super.onInit();
    signalsDetails();
  }

  @override
  Future<void> signalsDetails() async {
    final result = await _repository.signalsDetails(id);
    if (result is SignalDetailsModel) {
      signalDetailsModel = result;
      print('================== succcus');
    } else {
      await signalsDetails();
    }
    update();
  }
}
