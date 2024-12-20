import 'package:currency_trading/logic/controllers/signal_details_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Color> progressColors = [
  const Color(0xffFF0004),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
];

// class SignalDetailsStatisticsWidget extends StatelessWidget {
//   const SignalDetailsStatisticsWidget({
//     super.key,
//     required this.entry,
//     required this.stop,
//     required this.tp1,
//     required this.tp2,
//     required this.tp3,
//     required this.tp4,
//     required this.tp5,
//   });
//   final String entry;
//   final String stop;
//   final String tp1;
//   final String tp2;
//   final String tp3;
//   final String tp4;
//   final String tp5;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SignalDetailsControllerImpl>(
//       builder: (controller) =>
//           Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Text('Stop', style: TextStyle(color: Colors.white)),
//           Text('Entry', style: TextStyle(color: Colors.white)),
//           Text('TP1', style: TextStyle(color: Colors.green)),
//           Text('TP2', style: TextStyle(color: Colors.green)),
//           Text('TP3', style: TextStyle(color: Colors.white)),
//           Text('TP4', style: TextStyle(color: Colors.white)),
//           Text('TP5', style: TextStyle(color: Colors.white))
//         ]),
//         const CustomVerticalSizedox(height: 5),
//         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Text(stop, style: const TextStyle(color: Colors.white)),
//           Text(entry, style: const TextStyle(color: Colors.white)),
//           Text(tp1, style: TextStyle(color: Colors.green)),
//           Text(tp2, style: TextStyle(color: Colors.green)),
//           Text(tp3, style: TextStyle(color: Colors.white)),
//           Text(tp4, style: TextStyle(color: Colors.white)),
//           Text(tp5, style: TextStyle(color: Colors.white))
//         ]),
//         const CustomVerticalSizedox(height: 10),
//         Stack(clipBehavior: Clip.none, children: [
//           Column(children: [
//             Row(
//                 children: List.generate(progressColors.length, (index) {
//               return Expanded(
//                   child: Stack(alignment: Alignment.center, children: [
//                 Container(
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(2),
//                             bottomLeft: Radius.circular(2),
//                             topRight: Radius.circular(2),
//                             bottomRight: Radius.circular(2)),
//                         color: progressColors[index]),
//                     height: 20),
//                 if (index < progressColors.length - 1)
//                   Positioned(
//                       right: 0,
//                       child: Container(
//                           width: 2,
//                           height: 20,
//                           color: Colors.white.withOpacity(.1)))
//               ]));
//             }))
//           ]),
//           Positioned(
//               left: 0,
//               top: -8,
//               child: Container(
//                   width: 4,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       color: const Color(0xff383F76),
//                       borderRadius: BorderRadius.circular(1))))
//         ])
//       ]),
//     );
//   }
// }


class SignalDetailsStatisticsWidget extends StatelessWidget {
  const SignalDetailsStatisticsWidget({
    super.key,
    required this.entry,
    required this.stop,
    required this.tp1,
    required this.tp2,
    required this.tp3,
    required this.tp4,
    required this.tp5,
    required this.indicatorValue, // قيمة المؤشر
  });

  final String entry;
  final String stop;
  final String tp1;
  final String tp2;
  final String tp3;
  final String tp4;
  final String tp5;
  final double indicatorValue; // قيمة المؤشر بين 0 و 1

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // عرض الشاشة
    final numBoxes = 6; // عدد المربعات
    final boxWidth = screenWidth / numBoxes; // عرض كل مربع
    final entryValue = double.tryParse(entry) ?? 0.0; // تحويل قيمة الإدخال
    final indicatorPosition = indicatorValue * screenWidth; // موقع المؤشر

    return GetBuilder<SignalDetailsControllerImpl>(
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Stop', style: TextStyle(color: Colors.white)),
              Text('Entry', style: TextStyle(color: Colors.white)),
              Text('TP1', style: TextStyle(color: Colors.green)),
              Text('TP2', style: TextStyle(color: Colors.green)),
              Text('TP3', style: TextStyle(color: Colors.white)),
              Text('TP4', style: TextStyle(color: Colors.white)),
              Text('TP5', style: TextStyle(color: Colors.white)),
            ],
          ),
          const CustomVerticalSizedox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(stop, style: const TextStyle(color: Colors.white)),
              Text(entry, style: const TextStyle(color: Colors.white)),
              Text(tp1, style: const TextStyle(color: Colors.green)),
              Text(tp2, style: const TextStyle(color: Colors.green)),
              Text(tp3, style: const TextStyle(color: Colors.white)),
              Text(tp4, style: const TextStyle(color: Colors.white)),
              Text(tp5, style: const TextStyle(color: Colors.white)),
            ],
          ),
          const CustomVerticalSizedox(height: 10),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: List.generate(
                  numBoxes,
                  (index) {
                    // حساب حدود كل مربع
                    double startBox = index * boxWidth;
                    double endBox = startBox + boxWidth;

                    // تحديد اللون بناءً على مقارنة المؤشر والإدخال
                    Color boxColor = Colors.transparent;
                    if (indicatorValue > entryValue) {
                      // المؤشر أكبر من الإدخال: اللون الأخضر
                      if (startBox >= entryValue &&
                          startBox <= indicatorPosition) {
                        boxColor = Colors.green;
                      }
                    } else {
                      // المؤشر أصغر من أو يساوي الإدخال: اللون الأحمر
                      if (startBox >= indicatorPosition &&
                          startBox <= entryValue) {
                        boxColor = Colors.red;
                      }
                    }

                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: boxColor,
                        ),
                        height: 20,
                      ),
                    );
                  },
                ),
              ),
              // المؤشر
              Positioned(
                left: indicatorPosition - 2, // موضع المؤشر بناءً على قيمته
                top: -8,
                child: Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xff383F76),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
