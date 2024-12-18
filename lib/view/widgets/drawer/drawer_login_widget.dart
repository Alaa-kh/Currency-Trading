import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/logic/controllers/auth/logout_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/auth/login/login_screen.dart';
import 'package:currency_trading/view/screens/notifications/notifications_screen.dart';
import 'package:currency_trading/view/widgets/drawer/model/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final name = Get.find<MyServices>().getBox.read(AppKey.name);
final wallet = Get.find<MyServices>().getBox.read(AppKey.wallet);
final id = Get.find<MyServices>().getBox.read(AppKey.id);

class DrawerLoginWidget extends StatelessWidget {
  const DrawerLoginWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LogoutControllerImpl());

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text(name,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text('Wallet: ${wallet.toString()} USDT',
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xffF2B80C))),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text('ID: ${id.toString()}',
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
      ListView.builder(
          shrinkWrap: true,
          itemExtent: 35,
          itemBuilder: (context, index) => GetBuilder<LogoutControllerImpl>(
              builder: (controller) => ListTile(
                
                  onTap: () {
                    signalsDrawerLoginModel[index].text == 'Login'
                        ? Get.off(() => const LoginScreen(),
                            transition: Transition.leftToRight,
                            duration: const Duration(milliseconds: 800))
                        : signalsDrawerLoginModel[index].text == 'Notifications'
                            ? Get.to(() => const NotificationsScreen(),
                                transition: Transition.leftToRight,
                                duration: const Duration(milliseconds: 800))
                            : signalsDrawerLoginModel[index].text == 'Log out'
                                ? controller.logout()
                                : () {};
                  },
                  leading: Image.asset(signalsDrawerLoginModel[index].icon,
                      width: 22,height: 22,),
                  title: Text(signalsDrawerLoginModel[index].text,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14)))),
          itemCount: signalsDrawerLoginModel.length),
      const CustomVerticalSizedox(height: 50),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffF2B80C), width: 2)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(IconsAssets.copyIcon, width: 12, height: 14),
            const SizedBox(width: 5),
            const Text('Invitation Code: XMRET',
                style: TextStyle(color: Colors.white)),
          ])),
      const CustomVerticalSizedox(height: 40),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 130, 130, 130),
            Color.fromARGB(255, 130, 130, 130),
            Color.fromARGB(255, 57, 57, 57),
            Color.fromARGB(255, 57, 57, 57),
            Color.fromARGB(255, 130, 130, 130),
            Color.fromARGB(255, 130, 130, 130),
          ])),
          width: double.infinity,
          height: 2),
      const CustomVerticalSizedox(height: 40)
    ]);
  }
}
