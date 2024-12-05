import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';

class AccessCardWidget extends StatelessWidget {
  const AccessCardWidget({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border:
                Border(right: BorderSide(color: Colors.white.withOpacity(.1)))),
        child: Column(children: [
          Text(
            'Signals/Daily',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xffF7F7F7)),
          ),
          const CustomVerticalSizedox(height: 10),
          Image.asset(IconsAssets.rightIcon, color: color)
        ]));
  }
}
