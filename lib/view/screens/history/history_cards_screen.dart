import 'package:currency_trading/logic/controllers/history_details_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/screens/history/widgets/history_cards_grid_view_widget.dart';
import 'package:currency_trading/view/widgets/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCardsScreen extends GetView<HistoryDetailsControllerImp> {
  const HistoryCardsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryDetailsControllerImp());
    return Scaffold(
      endDrawer: const DrawerWidget(),
      appBar: mainAppBar(
          '',
          Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back, color: Colors.white)))),
      body: GetBuilder<HistoryDetailsControllerImp>(
          builder: (_) => Container(
                width: double.infinity,
                height: double.maxFinite,
                decoration: mainLinearGradient(),
                child: controller.historyDetailsModel != null
                    ? SingleChildScrollView(
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomVerticalSizedox(height: 10),
                                  const Text('Hassan Mhd',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700)),
                                  Container(
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 20,
                                                color: Color.fromARGB(
                                                    255, 156, 155, 155))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(11)),
                                      child: Text('Ultimate',
                                          style: const TextStyle(
                                              color: Color(0xffF2B80C),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17))),
                                  const CustomVerticalSizedox(height: 40),
                                  Text(
                                      controller.historyDetailsModel!.data[0]
                                          .currencyType,
                                      style: const TextStyle(
                                          color: Color(0xffF7F7F7),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22)),
                                  const CustomVerticalSizedox(height: 20),
                                  const HistoryCardsGridViewWidget(),
                                  const CustomVerticalSizedox(height: 20),
                                ])))
                    : Center(
                        child: const CircularProgressIndicator(
                        color: Color(0xffF2B80C),
                      )),
              )),
    );
  }
}
