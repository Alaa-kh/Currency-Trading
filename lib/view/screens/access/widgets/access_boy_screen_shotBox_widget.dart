import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:flutter/material.dart';

class AccessBoyScreenShotBoxWidget extends StatelessWidget {
  const AccessBoyScreenShotBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 60),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(colors: [
                Color(0xff383F76),
                Color(0xff34A9FF),
              ])),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('NETWORK',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700)),
            const Text('TRC20',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700)),
            const CustomVerticalSizedox(height: 15),
            Row(children: [
              Image.asset(IconsAssets.copyDialogIcon),
              const SizedBox(width: 7),
              Text('TP1fj7ejPwHJ78bh8XEkCmDhfpeJC42in7',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700))
            ]),
            const CustomVerticalSizedox(height: 27),
            const Text('Attach The Screenshot',
                style: TextStyle(color: Colors.white, fontSize: 14)),
            const CustomVerticalSizedox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color(0xff282828).withOpacity(.4),
                  prefixIcon: Image.asset(IconsAssets.vectorIcon),
                  labelStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            const CustomVerticalSizedox(height: 25),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(23),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white.withOpacity(.1)),
                child: Text(
                    'Send a screenshot of the payment  to get access right away.',
                    style: TextStyle(color: Colors.white, fontSize: 13))),
            const CustomVerticalSizedox(height: 25),
            Center(
                child: Container(
                    width: 162,
                    decoration: BoxDecoration(
                        color: Color(0xff263775),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconsAssets.sendIcon),
                          const SizedBox(width: 8),
                          Text('Send',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20))
                        ])))
          ])),
      Positioned(right: 1, child: Image.asset(ImagesAssets.decorationImage))
    ]);
  }
}