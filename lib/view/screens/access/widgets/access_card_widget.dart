import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';

class AccessCardWidget extends StatelessWidget {
  const AccessCardWidget({
    super.key,
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return
        Column(children: [
      Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w700, color: Color(0xffF7F7F7)),
      ),
      const CustomVerticalSizedox(height: 10),
      Image.asset(IconsAssets.rightIcon, color: color)
    ]);
  }
}
