import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_analysis_copy_widget.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_card_widget.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_statistics_widget.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_table_widget.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_totallist_widget.dart';
import 'package:flutter/material.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/widgets/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:get/get.dart';

class SignalDetailsScreen extends StatelessWidget {
  const SignalDetailsScreen(
      {super.key,
      required this.type,
      required this.currencyType,
      required this.createdAt,
      required this.entry,
      required this.stop,
      required this.leverage,
      required this.currentPrice,
      required this.number,
      required this.ratio, required this.index});
  final String type;
  final String currencyType;
  final String createdAt;
  final String entry;
  final String stop;
  final String leverage;
  final String currentPrice;
  final String number;
  final String ratio;
final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Signal Details',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: Container(
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomVerticalSizedox(height: 20),
                          SignalDetailsCardWidget(
                            currencyType: currencyType,
                            type: type,
                            createdAt: createdAt,
                            entry: entry,
                            stop: stop,
                            leverage: leverage,
                          ),
                          const CustomVerticalSizedox(height: 25),
                          const Text(
                              'The current price indicator according to the Trade.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12)),
                          const CustomVerticalSizedox(height: 33),
                          SignalDetailsStatisticsWidget(
                              stop: stop, entry: entry),
                          const CustomVerticalSizedox(height: 28),
                          const Text(
                              'If the indicator is close to the Entry Point, then it’s still possibleto enter the trade.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12)),
                          const CustomVerticalSizedox(height: 33),
                          SignalDetailsTableWidget(
                              currentPrice: currentPrice,
                              number: number,
                              ratio: ratio,
                              index: index),
                          const CustomVerticalSizedox(height: 22),
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SignalDetailsAnalysisCopyWidget(
                                    icon: IconsAssets.analysiIcon,
                                    text: 'Analysis',
                                    color: Color(0xffF2B80C)),
                                SizedBox(width: 15),
                                SignalDetailsAnalysisCopyWidget(
                                    icon: IconsAssets.copyIcon,
                                    text: 'Copy',
                                    color: Color(0xff704EF4))
                              ]),
                          const CustomVerticalSizedox(height: 23),
                          const Text(
                              'We recommend that the risk in each trade should be from 3-5% of the total cap.',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                              textAlign: TextAlign.center),
                          const CustomVerticalSizedox(height: 17),
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff151515),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 11,
                                        color: Color.fromARGB(255, 37, 37, 37))
                                  ],
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(children: [
                                const CustomVerticalSizedox(height: 10),
                                TextField(
                                  textAlign: TextAlign.left,
                                    textAlignVertical: TextAlignVertical.center,
decoration: InputDecoration(
  hintText: 'Your total amount',
  
  hintStyle: const TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),
  suffixIcon: InkWell(onTap: () {
    signalDetailsDialog();
  },child: Image.asset(IconsAssets.editIcon)),
  contentPadding: const EdgeInsets.symmetric(horizontal: 18),
enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(.1)))
 ),
 
                                    style:const TextStyle(
                  fontWeight: FontWeight.w700,
                  color:  Color(0xffF2B80C),
                  fontSize: 17),
                                  ),
                               
                                const SignalDetailsTotalListWidget(
                                    title:
                                        'Our recommendation is to invest in this trade',
                                    total: r'$ 50'),
                              ])),
                          const CustomVerticalSizedox(height: 20)
                        ])))));
  }
}
