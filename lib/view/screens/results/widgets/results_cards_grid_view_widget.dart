import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';

class ResultsCardsGridViewWidget extends StatelessWidget {
  const ResultsCardsGridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 250,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 100,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15),
            itemCount: 6,
            itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(IconsAssets.numberOfTradesIcon,
                              width: 32),
                          Text('Number of Trades\n22',
                              style: TextStyle(
                                  color: Color(0xffF7F7F7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center)
                        ])))));
  }
}
