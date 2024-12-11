import 'package:currency_trading/model/general_model.dart';
import 'package:currency_trading/repo/general_repo.dart';
import 'package:get/get.dart';

abstract class GeneralController extends GetxController {
  Future<void> generalData();
}

class GeneralControllerImpl extends GeneralController {
  final GeneralRepositoryImpl _repository = GeneralRepositoryImpl();
  GeneralModel? gneralModel;
  @override
  void onInit() {
    super.onInit();
    generalData();
  }

  @override
  Future<void> generalData() async {
    final result = await _repository.fetchGeneralData();
    if (result is GeneralModel) {
      gneralModel = result;
      print('======================succcus');
    } else {
      await generalData();
    }
    update();
  }

  // @override
  // Future<void> openTelegram(String telegram) async {
  //   final String telegramUrl = telegram;
  //   final String telegramWebUrl = telegram;

  //   if (await canLaunchUrl(Uri.parse(telegramUrl))) {
  //     await launchUrl(Uri.parse(telegramUrl));
  //   } else {
  //     if (await canLaunchUrl(Uri.parse(telegramWebUrl))) {
  //       await launchUrl(Uri.parse(telegramWebUrl));
  //     } else {
  //       throw 'Could not launch Telegram';
  //     }
  //   }
  // }
}
