import 'package:currency_trading/logic/controllers/history_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/history/history_cards_screen.dart';
import 'package:currency_trading/view/screens/history/widgets/history_info_cards_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryMainListWidget extends StatelessWidget {
  const HistoryMainListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryControllerImpl>(
        builder: (controller) => ListView.separated(
            separatorBuilder: (context, index) =>
                const CustomVerticalSizedox(height: 20),
            itemCount: controller.historyMod.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) =>
                Stack(clipBehavior: Clip.none, children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xff383F76)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.historyMod[index].name.toString(),
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffF7F7F7))),
                            Center(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                  HistoryInfoCardsWidget(
                                    icon: IconsAssets.numberOfTradesIcon,
                                    label: 'Number of Trades',
                                    number: controller.historyMod[index].count
                                        .toString(),
                                  ),
                                  HistoryInfoCardsWidget(
                                    icon: IconsAssets.totalProfitIcon,
                                    label: 'Total Profit',
                                    number: controller.historyMod[index].profit
                                        .toString(),
                                  ),
                                  HistoryInfoCardsWidget(
                                    icon: IconsAssets.winRateIcon,
                                    label: 'Win Rate',
                                    number: controller.historyMod[index].winRate
                                        .toString(),
                                  ),
                                ]))
                          ])),
                  Positioned(
                      right: -15,
                      bottom: 50,
                      top: 50,
                      child: InkWell(
                          onTap: () => Get.to(() => const HistoryCardsScreen()),
                          child: Image.asset(IconsAssets.detailsArrowIcon,
                              width: 32)))
                ])));
  }
}
