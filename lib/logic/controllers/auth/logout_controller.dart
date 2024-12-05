import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/model/auth/logout_model.dart';
import 'package:currency_trading/repo/auth/logout_repo.dart';
import 'package:currency_trading/shared/custom_dialog.dart';
import 'package:currency_trading/shared/custom_loading.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/view/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogoutController extends GetxController {
  Future<void> logout();
}

class LogoutControllerImpl extends LogoutController {
  final _box = Get.find<MyServices>().getBox;
  final LogoutRepositoryImpl _repo = LogoutRepositoryImpl();
  @override
  Future<void> logout() async {
    try {
      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            surfaceTintColor: Colors.amber,
            backgroundColor: Colors.grey,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close)),
                ),
                Text(
                  'Are You Sure Logout?'.tr,
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  Get.back();
                  showLoadingDialog();
                  final result = await _repo.logout();
                  Get.back();
                  if (result is LogOutModel) {
                    Get.deleteAll();
                    _clearUserData();
                    // Navigate to the initial screen and clear navigation history
                    Get.off(() => const LoginScreen());
                  } else if (result is Failures) {
                    showTextDialog(
                      result.errMessage,
                      true,
                    );
                  }
                },
                child: Text(
                  'ok'.tr,
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                ),
              ),
              const SizedBox(width: 5),
              TextButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 134, 134, 134)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'cancel'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            ],
          ));
    } catch (_) {}
  }

  void _clearUserData() {
    _box.remove(AppKey.name);
    _box.remove(AppKey.id);
    _box.remove(AppKey.email);
    _box.remove(AppKey.phoneNumber);
    _box.remove(AppKey.token);
    _box.remove(AppKey.photo);
    _box.remove(AppKey.verify);
  }
}
