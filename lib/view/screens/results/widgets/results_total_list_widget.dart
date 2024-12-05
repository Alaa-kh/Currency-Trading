import 'package:flutter/material.dart';

class ResultsTotalListWidget extends StatelessWidget {
  const ResultsTotalListWidget({
    super.key,
    this.icon,
    this.title,
    required this.total,
    this.sizeTotal,
  });

  final String? icon;
  final String? title;
  final String total;
  final double? sizeTotal;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(total,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffF2B80C),
                  fontSize: sizeTotal != null ? sizeTotal! : 17),
              textAlign: title == null ? TextAlign.center : TextAlign.end),
          const SizedBox(width: 13),
          icon != null ? Image.asset(icon!) : const SizedBox()
        ]),
        leading: Text(title != null ? title! : '',
            style: const TextStyle(color: Colors.white, fontSize: 14)));
  }
}
