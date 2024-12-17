import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/logic/controllers/auth/logout_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/view/screens/auth/login/login_screen.dart';
import 'package:currency_trading/view/screens/notifications/notifications_screen.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_login_widget.dart';
import 'package:currency_trading/view/widgets/drawer/model/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final token = Get.find<MyServices>().getBox.read(AppKey.token);

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LogoutControllerImpl());
    return ClipRRect(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(60)),
        child: GetBuilder<LogoutControllerImpl>(
            builder: (controller) => Drawer(
                width: 236,
                backgroundColor: const Color(0xff757575),
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const CustomVerticalSizedox(height: 40),
                  Image.asset(ImagesAssets.logoImage, width: 60),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(IconsAssets.drawerbackIcon))),
                  const CustomVerticalSizedox(height: 10),
                  token != null
                      ? const DrawerLoginWidget()
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemExtent: 30,
                              itemBuilder: (context, index) => ListTile(
                                  onTap: () {
                                    signalsDrawerModel[index].text == 'Login'
                                        ? Get.off(() => const LoginScreen())
                                        : signalsDrawerModel[index].text ==
                                                'Notifications'
                                            ? Get.to(() =>
                                                const NotificationsScreen())
                                            : () {};
                                  },
                                  leading: Image.asset(
                                      signalsDrawerModel[index].icon,
                                      width: 22),
                                  title: Text(signalsDrawerModel[index].text,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14))),
                              itemCount: signalsDrawerModel.length),
                        ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset(IconsAssets.telegramIcon, width: 50),
                    Image.asset(IconsAssets.whatsappIcon, width: 50),
                    Image.asset(IconsAssets.youtubeIcon, width: 50),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset(IconsAssets.twitterIcon, width: 50),
                    Image.asset(IconsAssets.discordIcon, width: 50),
                  ]),
                  const CustomVerticalSizedox(height: 10)
                ])))));
  }
}
