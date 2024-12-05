import 'package:currency_trading/logic/controllers/general_controller.dart';
import 'package:currency_trading/view/screens/access/access_info_pay_screen.dart';
import 'package:currency_trading/view/screens/access/widgets/access_months_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessBoyCouponWidget extends StatelessWidget {
  const AccessBoyCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralControllerImpl>(
        builder: (controller) => InkWell(
            onTap: () => Get.to(() => const AccessInfoPayScreen()),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccessMonthsWidget(
                      numberMonth: 1,
                      value: controller.gneralModel != null
                          ? controller.gneralModel!.data.basic.oneMonth
                          : ''),
                  const SizedBox(width: 8),
                  AccessMonthsWidget(
                      numberMonth: 3,
                      value: controller.gneralModel != null
                          ? controller.gneralModel!.data.basic.threeMonth
                          : ''),
                  const SizedBox(width: 8),
                  AccessMonthsWidget(
                      numberMonth: 6,
                      value: controller.gneralModel != null
                          ? controller.gneralModel!.data.basic.sixMonth
                          : '')
                ])));
  }
}
