import 'package:currency_trading/model/signals/signal_details_model.dart';
import 'package:currency_trading/model/signals/signals_model.dart';
import 'package:currency_trading/model/signals/signals_slider_model.dart';
import 'package:currency_trading/repo/signals/signals_repo.dart';
import 'package:get/get.dart';

abstract class SignalsController extends GetxController {
  Future<void> sliderImages();
  Future<void> signals();
  Future<void> signalsDetails(int id);
}

class SignalsControllerImpl extends SignalsController {
  final SignalsRepositoryImpl _repository = SignalsRepositoryImpl();
  SignalsSliderModel? signalsSliderModel;

  @override
  Future<void> sliderImages() async {
    final result = await _repository.fetchSliderImages();
    if (result is SignalsSliderModel) {
      signalsSliderModel = result;
      print('succcus');
    } else {
      await sliderImages();
    }
    update();
  }

  // ===================

  SignalsModel? signalsModel;

  @override
  Future<void> signals() async {
    final result = await _repository.signals();
    if (result is SignalsModel) {
      signalsModel = result;
      print('================== succcus');
    } else {
      await signals();
    }
    update();
  }

// ===================

  SignalDetailsModel? signalDetailsModel;

  @override
  Future<void> signalsDetails(int id) async {
    final result = await _repository.signalsDetails(id);
    if (result is SignalDetailsModel) {
      signalDetailsModel = result;
      print('================== succcus');
    } else {
      await signalsDetails(id);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    sliderImages();
    signals();
  }
}
