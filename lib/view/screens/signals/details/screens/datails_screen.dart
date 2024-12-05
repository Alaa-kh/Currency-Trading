
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:currency_trading/logic/controllers/signals_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/details_cards_widget.dart';
import 'package:currency_trading/view/screens/signals/widgets/signals_under_slider_container_widget.dart';
import 'package:currency_trading/view/widgets/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';

class DetailsScreen extends GetView<SignalsControllerImpl> {
  const DetailsScreen({
    super.key,
    this.account,
    this.createdAt,
    this.currencyType,
    // this.image
  });
  final String? account;
  final String? createdAt;
  final String? currencyType;
  // final String? image;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
    Get.put(SignalsControllerImpl());
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Details',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: GetBuilder<SignalsControllerImpl>(
          builder: (controller) => Container(
              height: double.maxFinite,
              decoration: mainLinearGradient(),
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: GetBuilder<SignalsControllerImpl>(
                        builder: (_) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomVerticalSizedox(height: 10),
                              const Text('Hassan Mhd',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700)),
                              Text(account!,
                                  style: const TextStyle(
                                      color: Color(0xffADA9A9),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17)),
                              // controller.signalsSliderModel != null
                              // ?
                              // GetBuilder<SignalsControllerImpl>(
                              //   builder: (_) => CarouselSlider(
                              //     items: [
                              //       SignalsContainerSliderBoxWidget(
                              //           image: image!),
                              //     ],
                              //     options: CarouselOptions(
                              //       onPageChanged: (index, reason) {
                              //         currentIndexNotifier.value = index;
                              //       },
                              //       height: 180,
                              //       initialPage: 0,
                              //       enlargeCenterPage: true,
                              //       autoPlay: true,
                              //     ),
                              //   ),
                              // ),
                              // : const SizedBox.shrink(),
                              const CustomVerticalSizedox(height: 10),
                              ValueListenableBuilder<int>(
                                  valueListenable: currentIndexNotifier,
                                  builder: (context, currentIndex, child) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            3,
                                            (index) =>
                                                SignalsUnderSliderContainerWidget(
                                                    index: index,
                                                    currentIndex:
                                                        currentIndex)));
                                  }),
                              DetailsCardsWidget(
                                createdAt: createdAt!,
                                currencyType: currencyType!,
                                account: account!,
                              )
                            ]),
                      )))),
        ));
  }
}
