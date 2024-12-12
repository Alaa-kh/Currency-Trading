import 'package:currency_trading/logic/controllers/auth/logout_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/view/screens/auth/login/login_screen.dart';
import 'package:currency_trading/view/screens/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              child: Column(children: [
                const CustomVerticalSizedox(height: 50),
                Image.asset(ImagesAssets.logoImage, width: 60),
                Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(IconsAssets.drawerbackIcon))),
                const CustomVerticalSizedox(height: 10),
                Expanded(
                  child: ListView.builder(
                      itemExtent: 40,
                      itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            signalsDrawerModel[index].text == 'Login'
                                ? Get.off(() => const LoginScreen())
                                : signalsDrawerModel[index].text ==
                                        'Notifications'
                                    ? Get.to(() => const NotificationsScreen())
                                    : signalsDrawerModel[index].text ==
                                            'Log out'
                                        ? controller.logout()
                                        : () {};
                          },
                          leading: Image.asset(signalsDrawerModel[index].icon,
                              width: 28),
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
              ])),
        ));
  }
}

class SignalsDrawerModel {
  final String text;
  final String icon;
  SignalsDrawerModel({
    required this.text,
    required this.icon,
  });
}

List<SignalsDrawerModel> signalsDrawerModel = [
  SignalsDrawerModel(text: 'Login', icon: IconsAssets.loginIcon),
  SignalsDrawerModel(
      text: 'Notifications', icon: IconsAssets.notificationsIcon),
  SignalsDrawerModel(
      text: 'Privacy Policy', icon: IconsAssets.privacyPolicyIcon),
  SignalsDrawerModel(text: 'Terms Of Use', icon: IconsAssets.termsIcon),
  SignalsDrawerModel(text: 'Log out', icon: IconsAssets.logOutIcon),
];
