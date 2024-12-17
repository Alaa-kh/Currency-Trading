import 'package:currency_trading/logic/controllers/results_controller.dart';
import 'package:currency_trading/view/screens/results/widgets/results_cards_grid_widget.dart';
import 'package:currency_trading/view/screens/results/widgets/results_total_list_widget.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:flutter/material.dart';

import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:get/get.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResultsControllerImpl());
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Partnership',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: Container(
            width: double.infinity,
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: GetBuilder<ResultsControllerImpl>(
                      builder: (controller) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomVerticalSizedox(height: 10),
                            const MainNameContainerWidget(),
                            const CustomVerticalSizedox(height: 24),
                            SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: Row(
                                    children: List.generate(
                                        5,
                                        (index) => Expanded(
                                            child: InkWell(
                                                onTap: () {
                                                  controller.selectTime(
                                                    index,
                                                  );
                                                },
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    margin: index != 4
                                                        ? const EdgeInsets.only(
                                                            right: 13)
                                                        : null,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                        color: controller
                                                                    .selectedIndex ==
                                                                index
                                                            ? const Color(
                                                                0xff00A7FF)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color: controller
                                                                  .selectedIndex ==
                                                              index
                                                          ? const Color(
                                                              0xff267CBC)
                                                          : const Color(
                                                              0xff757575),
                                                    ),
                                                    child: Text(
                                                        controller
                                                            .timeItem[index],
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                19)))))))),
                            const CustomVerticalSizedox(height: 28),
                            const ResultsCardsGridWidget(),
                            const CustomVerticalSizedox(height: 23),
                            const Text(
                                'This means, if you invest a certain amount of money in each of these trades, this would be the outcome',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                                textAlign: TextAlign.center),
                            const CustomVerticalSizedox(height: 23),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white.withOpacity(.1)),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 5),
                                          blurRadius: 11,
                                          color:
                                              Color.fromARGB(255, 37, 37, 37))
                                    ],
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(children: [
                                  const CustomVerticalSizedox(height: 10),
                                  TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                IconsAssets.editIcon)),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 18),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white
                                                    .withOpacity(.1)))),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffF2B80C),
                                        fontSize: 17),
                                    textAlign: TextAlign.center,
                                  ),
                                  const ResultsTotalListWidget(
                                    title: 'Your Profit after 1 week',
                                    total: r'$ 888.31',
                                  )
                                ])),
                            const CustomVerticalSizedox(height: 23),
                            const Text(
                                'Start earning profits now! Subscribe and become a member of our community.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                                textAlign: TextAlign.center),
                            const CustomVerticalSizedox(height: 20),
                          ]),
                    )))));
  }
}
