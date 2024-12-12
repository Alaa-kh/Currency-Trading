import 'package:currency_trading/logic/controllers/notifications_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/widgets/main_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsInfoListWidget extends StatefulWidget {
  const NotificationsInfoListWidget({super.key});

  @override
  State<NotificationsInfoListWidget> createState() =>
      _NotificationsInfoListWidgetState();
}

class _NotificationsInfoListWidgetState
    extends State<NotificationsInfoListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('max');
        final controller = Get.find<NotificationsControllerImpl>();
        if (!controller.isLoadingMore) {
          controller.notifications();
        }
      }
    });
  }

  @override
  void dispose() {
    // إزالة المستمع عند التخلص من الودجت
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsControllerImpl());
    return GetBuilder<NotificationsControllerImpl>(
      builder: (controller) => ListView.separated(
        controller: _scrollController, // ربط الـ ScrollController بالقائمة
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Check if this is the last item and if loading more
          if (index == controller.notificationItems.length &&
              controller.isLoadingMore) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: MainCircularProgresswidget(),
              ),
            );
          }

          // Render normal notification items
          return SizedBox(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.notificationsModel!.data[index].title,
                    style: const TextStyle(
                      color: Color(0xffF7F7F7),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    controller.notificationsModel!.data[index].createdAt
                        .toString(),
                    style:
                        const TextStyle(fontSize: 10, color: Color(0xffF7F7F7)),
                  ),
                ],
              ),
              subtitle: Text(
                controller.notificationsModel!.data[index].txt,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                  color: Color(0xffF7F7F7),
                ),
              ),
              leading: Image.asset(IconsAssets.notificationIcon, width: 30),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const CustomVerticalSizedox(height: 13),
        itemCount: controller.isLoadingMore
            ? controller.notificationItems.length +
                1 // Add one for the loading indicator
            : controller.notificationItems.length,
      ),
    );
  }
}
