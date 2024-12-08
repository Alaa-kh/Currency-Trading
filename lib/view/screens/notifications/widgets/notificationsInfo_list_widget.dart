import 'package:currency_trading/logic/controllers/notifications_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationsInfoListWidget extends StatelessWidget {
  const NotificationsInfoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsControllerImpl>(
      builder: (controller) => ListView.separated(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => SizedBox(
              child: ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            controller.notificationsModel != null
                                ? controller
                                    .notificationsModel!.data[index].title
                                : '',
                            style: const TextStyle(
                                color: Color(0xffF7F7F7),
                                fontWeight: FontWeight.w600,
                                fontSize: 13)),
                        Text(
                            controller.notificationsModel != null
                                ? controller
                                    .notificationsModel!.data[index].createdAt
                                    .toString()
                                : '',
                            style: const TextStyle(
                                fontSize: 10, color: Color(0xffF7F7F7)))
                      ]),
                  subtitle: Text(
                      controller.notificationsModel != null
                          ? controller.notificationsModel!.data[index].txt
                          : '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                          color: Color(0xffF7F7F7))),
                  leading:
                      Image.asset(IconsAssets.notificationIcon, width: 30))),
          separatorBuilder: (context, index) =>
              const CustomVerticalSizedox(height: 13),
          itemCount: controller.notificationsModel != null
              ? controller.notificationsModel!.data.length
              : 0),
    );
  }
}
