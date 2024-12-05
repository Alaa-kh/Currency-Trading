import 'package:currency_trading/logic/controllers/results_controller.dart';
import 'package:currency_trading/view/screens/results/widgets/results_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsCardsGridWidget extends StatelessWidget {
  const ResultsCardsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultsControllerImpl>(
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResultsCardWidget(
                  title: 'Number of Trades',
                  value: controller.resultsModel != null
                      ? controller.resultsModel!.data.allNum.toString()
                      : ''),
              const SizedBox(width: 8),
              ResultsCardWidget(
                  title: 'Number of Trades',
                  value: controller.resultsModel != null
                      ? controller.resultsModel!.data.totalProfit.toString()
                      : ''),
              const SizedBox(width: 8),
              ResultsCardWidget(
                  title: 'Number of Trades',
                  value: controller.resultsModel != null
                      ? controller.resultsModel!.data.avgProfit.toString()
                      : ''),
            ],
          ),
const CustomVerticalSizedBox(height: 8),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResultsCardWidget(
                  title: 'Win Trades',
                  value: controller.resultsModel != null
                      ? controller.resultsModel!.data.winNum.toString()
                      : ''),
              const SizedBox(width: 8),
              ResultsCardWidget(
                  title: 'Lose Trades',
                  value: controller.resultsModel != null
                      ? controller.resultsModel!.data.loseNum.toString()
                      : ''),
              const SizedBox(width: 8),
              ResultsCardWidget(
                  title: 'Win Rate',
                  value: controller.resultsModel != null
                      ? controller.resultsModel!.data.winRate.toString()
                      : ''),
            ],
          ),
        ],
      ),
    );
  }
}
