import 'package:currency_trading/logic/controllers/history_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/history/history_cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryMainListWidget extends StatelessWidget {
  const HistoryMainListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
        GetBuilder<HistoryControllerImpl>(
          builder: (controller) =>
        ListView.separated(
            separatorBuilder: (context, index) =>
                const CustomVerticalSizedox(height: 20),
            itemCount:  controller.historyMod.length,
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
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffF7F7F7))),
                            SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Center(
                                    child: ListView.builder(
                                        itemExtent: 90,
                                        itemCount: 3,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemBuilder: (context, index) => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const CustomVerticalSizedox(
                                                            height: 10),
                                                        Image.asset(IconsAssets
                                                            .numberOfTradesIcon),
                                                        const CustomVerticalSizedox(
                                                            height: 10),
                                                        Text(
                                                            'Number of Trades\n\n ${controller.historyMod[index].count.toString()}',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .white),
                                                            textAlign: TextAlign
                                                                .center)
                                                      ])
                                                ]))))
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
    // );
  }
}
