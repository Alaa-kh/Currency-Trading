import 'package:flutter/material.dart';

class ResultsTotalListWidget extends StatelessWidget {
  const ResultsTotalListWidget({
    super.key,
    required this.title,
    required this.total,
  });

  final String title;
  final String total;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(total,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xffF2B80C),
                  fontSize: 25),
              textAlign: TextAlign.center),
          const SizedBox(width: 13),
        ]),
        leading: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 14)));
  }
}
