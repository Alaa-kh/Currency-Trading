import 'package:flutter/material.dart';

class SignalDetailsAnalysisCopyWidget extends StatelessWidget {
  const SignalDetailsAnalysisCopyWidget({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
  });
  final String text;
  final Color color;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(icon),
            const SizedBox(width: 10),
            Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 20))
          ])),
    );
  }
}
