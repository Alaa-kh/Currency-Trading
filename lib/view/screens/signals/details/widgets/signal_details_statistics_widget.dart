import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:flutter/material.dart';

final List<Color> progressColors = [
  const Color(0xffFF0004),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
];

class SignalDetailsStatisticsWidget extends StatelessWidget {
  const SignalDetailsStatisticsWidget({
    super.key, required this.entry, required this.stop,
  });
  final String entry;
  final String stop;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Stop', style: TextStyle(color: Colors.white)),
        Text('Entry', style: TextStyle(color: Colors.white)),
        Text('TP1', style: TextStyle(color: Colors.green)),
        Text('TP2', style: TextStyle(color: Colors.green)),
        Text('TP3', style: TextStyle(color: Colors.white)),
        Text('TP4', style: TextStyle(color: Colors.white)),
        Text('TP5', style: TextStyle(color: Colors.white))
      ]),
      const CustomVerticalSizedox(height: 5),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(stop, style: const TextStyle(color: Colors.white)),
        Text(entry, style: const TextStyle(color: Colors.white)),
        Text('1.978', style: TextStyle(color: Colors.green)),
        Text('2.557', style: TextStyle(color: Colors.green)),
        Text('2.15', style: TextStyle(color: Colors.white)),
        Text('3.555', style: TextStyle(color: Colors.white)),
        Text('4.12', style: TextStyle(color: Colors.white))
      ]),
      const CustomVerticalSizedox(height: 10),
      Stack(clipBehavior: Clip.none, children: [
        Column(children: [
          Row(
              children: List.generate(progressColors.length, (index) {
            return Expanded(
                child: Stack(alignment: Alignment.center, children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(2),
                          bottomLeft: Radius.circular(2),
                          topRight: Radius.circular(2),
                          bottomRight: Radius.circular(2)),
                      color: progressColors[index]),
                  height: 20),
              if (index < progressColors.length - 1)
                Positioned(
                    right: 0,
                    child: Container(
                        width: 2,
                        height: 20,
                        color: Colors.white.withOpacity(.1)))
            ]));
          }))
        ]),
        Positioned(
            left: 0,
            top: -8,
            child: Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xff383F76),
                    borderRadius: BorderRadius.circular(1))))
      ])
    ]);
  }
}
