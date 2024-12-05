import 'package:currency_trading/logic/controllers/results_controller.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsCardWidget extends StatelessWidget {
  const ResultsCardWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultsControllerImpl>(
        builder: (controller) => Expanded(
                child: Center(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(children: [
                      Image.asset(IconsAssets.numberOfTradesIcon, width: 32),
                      const SizedBox(height: 8),
                      Text('$title\n$value',
                          style: const TextStyle(
                            color: Color(0xffF7F7F7),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center)
                    ]),

                    // SizedBox(
                    //     width: double.infinity,
                    //     height: 250,
                    //     child:

                    //  GridView.builder(
                    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //         mainAxisExtent: 100,
                    //         crossAxisCount: 3,
                    //         crossAxisSpacing: 10,
                    //         mainAxisSpacing: 15),
                    //     itemCount: 6,
                    //     itemBuilder: (context, index) => Container(
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //             color: Colors.white.withOpacity(.2),
                    //             borderRadius: BorderRadius.circular(8)),
                    //         child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    //             child: Column(
                    //                 crossAxisAlignment: CrossAxisAlignment.center,
                    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                 children: [
                    //                   Image.asset(IconsAssets.numberOfTradesIcon,
                    //                       width: 32),
                    //                   Text('$title\n$value',
                    //                       style: const TextStyle(
                    //                           color: Color(0xffF7F7F7),
                    //                           fontSize: 12,
                    //                           fontWeight: FontWeight.w500),
                    //                       textAlign: TextAlign.center)
                    //                 ]))))

                    // ));
                  )),
            )));
  }
}
