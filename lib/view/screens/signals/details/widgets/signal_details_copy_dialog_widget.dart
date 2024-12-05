import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';

class SignalDetailsCopyDialogWidget extends StatelessWidget {
  const SignalDetailsCopyDialogWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
  });

  final String icon;
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xff23252F),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
              const CustomVerticalSizedox(height: 6),
              Text(
                title,
                style: const TextStyle(color: Color(0xff3D992B)),
              ),
              const CustomVerticalSizedox(height: 6),
              Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const CustomVerticalSizedox(height: 6),
              Image.asset(IconsAssets.copyDialogIcon)
            ]));
  }
}
