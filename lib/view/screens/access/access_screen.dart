import 'package:currency_trading/view/screens/access/access_boy_screen.dart';
import 'package:currency_trading/view/screens/access/widgets/access_boy_container_widget.dart';
import 'package:currency_trading/view/screens/access/widgets/access_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:get/get.dart';

class AccessScreen extends StatelessWidget {
  const AccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Access',
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomVerticalSizedox(height: 20),
                          Container(
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                    blurRadius: 20,
                                    color: Color.fromARGB(255, 70, 107, 133)),
                              ], borderRadius: BorderRadius.circular(11)),
                              child: Text('Basic',
                                  style: TextStyle(
                                      color: Color(0XFF34A9FF),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700))),
                          const CustomVerticalSizedox(height: 40),
                          Wrap(spacing: 20, runSpacing: 20, children: [
                            AccessCardWidget(color: Color(0xff00A7FF)),
                            AccessCardWidget(color: Color(0xff00A7FF)),
                            AccessCardWidget(color: Color(0xff00A7FF)),
                            AccessCardWidget(color: Color(0xff00A7FF)),
                            AccessCardWidget(color: Color(0xff00A7FF))
                          ]),
                          const CustomVerticalSizedox(height: 40),
                          InkWell(
                            onTap: () => Get.to(() => const AccessBoyScreen()),
                            child: AccessBoyContainerWidget(
                                text: r'Buy now $10 / Month',
                                color: Color(0xff00A7FF)),
                          ),
                          const CustomVerticalSizedox(height: 40),
                          Container(
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                    blurRadius: 20,
                                    color: Color.fromARGB(255, 139, 113, 33)),
                              ], borderRadius: BorderRadius.circular(11)),
                              child: Text('Ultimate',
                                  style: TextStyle(
                                      color: Color(0XFFF2B80C),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700))),
                          const CustomVerticalSizedox(height: 40),
                          Wrap(spacing: 20, runSpacing: 20, children: [
                            AccessCardWidget(color: Color(0XFFF2B80C)),
                            AccessCardWidget(color: Color(0XFFF2B80C)),
                            AccessCardWidget(color: Color(0XFFF2B80C)),
                            AccessCardWidget(color: Color(0XFFF2B80C)),
                            AccessCardWidget(color: Color(0XFFF2B80C))
                          ]),
                          const CustomVerticalSizedox(height: 40),
                          AccessBoyContainerWidget(
                              text: r'Buy now $30 / Month',
                              color: Color(0xffF2B80C)),
                          const CustomVerticalSizedox(height: 20),
                        ])))));
  }
}
