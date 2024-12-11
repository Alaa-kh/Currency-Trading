import 'package:currency_trading/logic/controllers/signals_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/view/screens/signals/details/screens/signal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignalsCardsWidget extends StatelessWidget {
  const SignalsCardsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignalsControllerImpl>(
      builder: (controller) => ListView.separated(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => controller
                    .signalsModel!.data[index].open ==
                1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const CustomVerticalSizedox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              controller.signalsModel!.data[index].currencyType,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          const Spacer(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 30,
                                    decoration: BoxDecoration(boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 20,
                                          color: Color.fromARGB(
                                              255, 156, 155, 155))
                                    ], borderRadius: BorderRadius.circular(11)),
                                    child: Text(
                                        controller
                                            .signalsModel!.data[index].type
                                            .toString(),
                                        style: TextStyle(
                                            color: controller.signalsModel!
                                                        .data[index].type ==
                                                    'buy'
                                                ? const Color(0xff00A7FF)
                                                : controller.signalsModel!
                                                            .data[index].type ==
                                                        'sell'
                                                    ? const Color(0xffFF0004)
                                                    : const Color(0xff947FFF),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 19)))
                              ])
                        ]),
                    const CustomVerticalSizedox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              controller.signalsModel!.data[index].currentPrice
                                  .toString(),
                              style: const TextStyle(
                                  color: Color(0xff00A7FF), fontSize: 14)),
                          Image.asset(ImagesAssets.pathRedImage,
                              height: 32, width: 72),
                          Row(children: [
                            Image.asset(ImagesAssets.pathImage),
                            const SizedBox(width: 10),
                            Text(
                                controller.signalsModel!.data[index].percentage
                                    .toString(),
                                style: const TextStyle(
                                    color: Color(0xffFF0004),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700))
                          ])
                        ]),
                    const CustomVerticalSizedox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text:
                                      'Entry ${controller.signalsModel!.data[index].entry.toString()}',
                                  style: const TextStyle(
                                      color: Color(0xff00FF09), fontSize: 12),
                                  children: <TextSpan>[
                                const TextSpan(
                                    text: '   -   ',
                                    style: TextStyle(color: Colors.white)),
                                TextSpan(
                                    text:
                                        'Stop ${controller.signalsModel!.data[index].stop.toString()}',
                                    style: const TextStyle(
                                      color: Color(0xffFF0004),
                                    ))
                              ])),
                          const Spacer(),
                          Row(children: [
                            Text(
                                controller.signalsModel!.data[index].createdAt
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10)),
                            const SizedBox(width: 10),
                            GestureDetector(
                                onTap: () => Get.to(() => SignalDetailsScreen(
                                      currencyType: controller.signalsModel!
                                          .data[index].currencyType,
                                      type: controller
                                          .signalsModel!.data[index].type
                                          .toString(),
                                      entry: controller
                                          .signalsModel!.data[index].entry
                                          .toString(),
                                      stop: controller
                                          .signalsModel!.data[index].stop
                                          .toString(),
                                      leverage: controller
                                          .signalsModel!.data[index].leverage
                                          .toString(),
                                      createdAt: controller
                                          .signalsModel!.data[index].createdAt
                                          .toString(),
                                      currentPrice: controller.signalsModel!
                                          .data[index].currentPrice
                                          .toString(),
                                      number: controller
                                          .signalsModel!.data[index].percentage
                                          .toString(),
                                      ratio: controller
                                          .signalsModel!.data[index].percentage
                                          .toString(),
                                      index: controller.signalsModel != null
                                          ? controller.signalsModel!.data.length
                                          : 0,
                                    )),
                                child: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white))
                          ])
                        ]),
                    const CustomVerticalSizedox(height: 5)
                  ])
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff23252F),
                    borderRadius: BorderRadius.circular(16)),
                alignment: Alignment.center,
                child: Row(children: [
                  Image.asset('assets/images/Group 37207.png', width: 37),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          controller.signalsModel!.data[index].currencyType
                              .toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      const CustomVerticalSizedox(height: 5),
                      Text(
                          DateFormat('dd-MM-yyyy hh:mma').format(
                              controller.signalsModel!.data[index].createdAt),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10))
                    ],
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xff263775),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Get',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: ' Basic',
                                style: TextStyle(
                                    color: Color(0xff34A9FF), fontSize: 12),
                              ),
                              TextSpan(
                                text: ' Or',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: ' Ultimate',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 139, 113, 33),
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: ' To See The Details',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          maxLines: 3, // يحدد الحد الأقصى لعدد السطور
                          overflow: TextOverflow
                              .ellipsis, // يقص النص إذا تجاوز المساحة
                          textAlign: TextAlign.center, // محاذاة النص للوسط
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      // onTap: () => Get.to(() => const SignalDetailsScreen()),
                      child: Image.asset(
                    IconsAssets.detailsArrowIcon,
                  ))
                ]),
              ),
        separatorBuilder: (context, index) {
          return controller.signalsModel!.data[index].open == 1
              ? Divider(color: Colors.grey.withOpacity(.3))
              : const CustomVerticalSizedox(height: 14);
        },
        itemCount: controller.signalsModel != null
            ? controller.signalsModel!.data.length
            : 0,
      ),
    );
  }
}
