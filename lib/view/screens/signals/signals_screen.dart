import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_trading/logic/controllers/signals_controller.dart';
import 'package:currency_trading/view/screens/signals/widgets/signals_container_slider_box_widget.dart';
import 'package:currency_trading/view/screens/signals/widgets/signals_cards_widget.dart';
import 'package:currency_trading/view/screens/signals/widgets/signals_under_slider_container_widget.dart';
import 'package:currency_trading/view/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:get/get.dart';

class SignalsScreen extends StatefulWidget {
  const SignalsScreen({super.key});

  @override
  State<SignalsScreen> createState() => _SignalsScreenState();
}

class _SignalsScreenState extends State<SignalsScreen> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SignalsControllerImpl());

    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Home',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Image.asset(ImagesAssets.logoImage))),
        body: Container(
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: GetBuilder<SignalsControllerImpl>(
                        builder: (controller) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CustomVerticalSizedox(height: 10),
                                  const Text('Hassan Mhd',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700)),
                                  Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 20,
                                                color: Color.fromARGB(
                                                    255, 156, 155, 155))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(11)),
                                      child: Text(
                                          controller.signalsModel != null
                                              ? controller
                                                  .signalsModel!.data[0].account
                                                  .toString()
                                              : '',
                                          style: const TextStyle(
                                              color: Color(0xffF2B80C),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17))),
                                  const CustomVerticalSizedox(height: 20),
                                  controller.signalsSliderModel != null
                                      ? CarouselSlider(
                                          items: [
                                            SignalsContainerSliderBoxWidget(
                                              image: controller
                                                  .signalsSliderModel!
                                                  .data[_currentIndexNotifier
                                                      .value]
                                                  .image,
                                            ),
                                          ],
                                          options: CarouselOptions(
                                            onPageChanged: (index, reason) {
                                              _currentIndexNotifier.value =
                                                  index;
                                            },
                                            height: 180,
                                            initialPage: 0,
                                            enlargeCenterPage: true,
                                            autoPlay: true,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  const CustomVerticalSizedox(height: 10),
                                  ValueListenableBuilder<int>(
                                      valueListenable: _currentIndexNotifier,
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
                                  const CustomVerticalSizedox(height: 20),
                                  const SignalsCardsWidget()
                                ]))))));
  }
}
