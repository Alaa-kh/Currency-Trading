import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainNameContainerWidget extends StatelessWidget {
  const MainNameContainerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final box = Get.find<MyServices>().getBox;
    final name = box.read(AppKey.name);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name != null ? name.toString() : '',
          style: const TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700),
        ),
        Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  blurRadius: 20, color: Color.fromARGB(255, 156, 155, 155))
            ], borderRadius: BorderRadius.circular(11)),
            child: Text('Ultimate',
                style: const TextStyle(
                    color: Color(0xffF2B80C),
                    fontWeight: FontWeight.w700,
                    fontSize: 17))),
      ],
    );
  }
}
