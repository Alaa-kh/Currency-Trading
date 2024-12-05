import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_trading/logic/controllers/signals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignalsContainerSliderBoxWidget extends StatelessWidget {
  const SignalsContainerSliderBoxWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    Get.put(SignalsControllerImpl());
    return GetBuilder<SignalsControllerImpl>(
      builder: (controller) => Container(
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(children: [
                CachedNetworkImage(
                  fit: BoxFit.contain,
                  width: double.infinity,
                  imageUrl: 'https://crypto-signals-ultimate.com/$image',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                // const Positioned(
                //     bottom: 1,
                //     child: Padding(
                //         padding: EdgeInsets.all(18.0),
                //         child: Text(
                //             'Lorem Ipsum is simply dummy text of\n the printing and typesetting industry.',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.bold),
                //             textAlign: TextAlign.left)))
              ]))),
    );
  }
}
