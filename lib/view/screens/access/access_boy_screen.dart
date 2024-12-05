import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/view/screens/access/widgets/access_boy_coupon_widget.dart';
import 'package:currency_trading/view/screens/access/widgets/access_boy_screen_shotBox_widget.dart';
import 'package:currency_trading/view/widgets/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessBoyScreen extends StatelessWidget {
  const AccessBoyScreen({super.key});

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
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const CustomVerticalSizedox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Hassan Mhd',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700)),
                            Image.asset(ImagesAssets.payImage)
                          ])),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text('Not Subscribe',
                          style: const TextStyle(
                              color: Color(0xffADA9A9),
                              fontWeight: FontWeight.w300,
                              fontSize: 17))),
                  const CustomVerticalSizedox(height: 14),
                  Image.asset(ImagesAssets.basicImage),
                  const CustomVerticalSizedox(height: 26),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Enter Your Coupon ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            const CustomVerticalSizedox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 14.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor:
                                      const Color(0xff282828).withOpacity(.4),
                                  prefixIcon:
                                      Image.asset(IconsAssets.couponIcon),
                                  labelStyle:
                                      const TextStyle(color: Colors.white)),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const CustomVerticalSizedox(height: 20),
                            const AccessBoyCouponWidget(),
                            const CustomVerticalSizedox(height: 20),
                            const AccessBoyScreenShotBoxWidget(),
                            const CustomVerticalSizedox(height: 20)
                          ]))
                ]))));
  }
}
