import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/model/auth/send_code_model.dart';
import 'package:currency_trading/repo/auth/send_code_repo.dart';
import 'package:currency_trading/shared/custom_dialog.dart';
import 'package:currency_trading/shared/custom_loading.dart';
import 'package:currency_trading/view/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SendCodeController extends GetxController {
  Future<void> sendCode();
  Future<void> verifyCode(String code);
}

class SendCodeControllerImpl extends SendCodeController {
  final SendCodeRepositoryImpl _repository = SendCodeRepositoryImpl();
  String codeFromResponse = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  /// Registers a new user with the provided details from the form.
  @override
  Future<void> sendCode() async {
    try {
      if (!formKey.currentState!.validate()) return;
      showLoadingDialog();

      final result = await _repository.sendCode(
        email: emailController.text.trim(),
      );

      Get.back();
      if (result is SendCodeModel) {
        codeFromResponse = result.data.verificationCode.toString();
      } else if (result is Failures) {
        showTextDialog(
          result.data.entries.first.value.first,
          true,
        );
      }
    } catch (_) {}
  }

  @override
  Future<void> verifyCode(String code) async {
    if (codeFromResponse == code) {
      Get.off(() => const RootScreen());
    } else {
      Get.snackbar('Error', 'Code is not correct!');
    }
  }

}
