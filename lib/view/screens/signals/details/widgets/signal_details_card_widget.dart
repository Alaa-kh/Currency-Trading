
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:flutter/material.dart';

class SignalDetailsCardWidget extends StatelessWidget {
  const SignalDetailsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff383F76)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomVerticalSizedox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('LDOUSDT',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    height: 30,
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          blurRadius: 20,
                          color: Color.fromARGB(255, 156, 155, 155))
                    ], borderRadius: BorderRadius.circular(11)),
                    child: Text('Buy',
                        style: TextStyle(
                            color: const Color(0xff00A7FF),
                            fontWeight: FontWeight.w700,
                            fontSize: 19)))
              ])
            ]),
            const CustomVerticalSizedox(height: 5),
            Text(
              '04-11-2024 12:40Am',
              style: const TextStyle(color: Color(0xffF7F7F7), fontSize: 10),
            ),
            const CustomVerticalSizedox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                  text: TextSpan(
                      text: 'Entry 1111',
                      style: const TextStyle(
                          color: Color(0xff00FF09), fontSize: 12),
                      children: <TextSpan>[
                    const TextSpan(
                        text: '   -   ', style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'Stop 1111',
                        style: const TextStyle(
                          color: Color(0xffFF0004),
                        )),
                    TextSpan(
                        text: '   -   ', style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'Leverage X5',
                        style: const TextStyle(
                          color: Color(0xff947FFF),
                        )),
                    TextSpan(
                        text: '   -   ', style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'Risk 3%',
                        style: const TextStyle(
                          color: Color(0xffFF6960),
                        )),
                  ])),
            ]),
            const CustomVerticalSizedox(height: 5)
          ]),
    );
  }
}