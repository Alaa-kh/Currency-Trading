

import 'package:currency_trading/view/screens/access/access_info_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessBoyCouponWidget extends StatelessWidget {
  const AccessBoyCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 120,
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => InkWell(
            onTap: ()=> Get.to(()=> const AccessInfoPayScreen()),
              child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff383F76),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16))),
                        child: Text('1 Month',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700))),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color(0xff34A9FF),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16))),
                        child: Text('10 USDT',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)))
                  ])),
            )));
  }
}
