import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/model/auth/chech_email.dart';
import 'package:currency_trading/model/auth/register_model.dart';
import 'package:currency_trading/model/auth/send_code_model.dart';
import 'package:currency_trading/repo/auth/check_email_repo.dart';
import 'package:currency_trading/repo/auth/register_repo.dart';
import 'package:currency_trading/repo/auth/send_code_repo.dart';
import 'package:currency_trading/shared/custom_dialog.dart';
import 'package:currency_trading/shared/custom_loading.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/view/screens/auth/verify/verify_screen.dart';
import 'package:currency_trading/view/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterController extends GetxController {
  Future<void> registerUser();
  void checked(bool value);
}

class RegisterControllerImpl extends RegisterController {
  final _box = Get.find<MyServices>().getBox;
  final RegisterRepositoryImpl _repository = RegisterRepositoryImpl();
  final CheckEmailRepositoryImpl _chechEmailRepository =
      CheckEmailRepositoryImpl();
  final SendCodeRepositoryImpl _sendCodeRepository = SendCodeRepositoryImpl();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController inviteCodeController = TextEditingController();
  bool isChecked = false;

  /// Registers a new user with the provided details from the form.
  @override
  Future<void> registerUser() async {
    try {
      if (!formKey.currentState!.validate()) return;
      showLoadingDialog();
      final resultCheckEmail = await _chechEmailRepository.checkEmail(
        email: emailController.text.trim(),
      );
      if (resultCheckEmail is CheckEmailModel) {
        if (resultCheckEmail.found == 1) {
      
         Get.snackbar('Error',
                                          'Email is already exists',
                                          backgroundColor: Colors.red);
        } else {
          print('1111111111111111111');
          final resultRegidter = await _repository.registerUser(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            passwordConfirmation: passwordConfirmationController.text.trim(),
            inviteCode: inviteCodeController.text.trim(),
          );
          print('222222222222222222222222');
          if (resultRegidter is RegisterModel) {
            final resultSendCode = await _sendCodeRepository.sendCode(
              email: emailController.text.trim(),
            );
            print('333333333333333333333333333333');

            if (resultSendCode is SendCodeModel) {
              Get.off(() => const VerifyScreen());
            }
            print('333333333333333333333333333333');
            _storeUserData(resultRegidter);
          } else {}
        }
      }

      final result = await _repository.registerUser(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        passwordConfirmation: passwordConfirmationController.text.trim(),
        inviteCode: inviteCodeController.text.trim(),
      );
      Get.back();
      if (result is RegisterModel) {
        _storeUserData(result);
        Get.off(() => RootScreen());
      } else if (result is Failures) {
        if (result.data is Map<String, dynamic>) {
          showTextDialog(
            result.data.entries.first.value.first,
            true,
          );
        }
      }
    } catch (_) {}
  }

  /// Stores user data after successful registration.
  void _storeUserData(RegisterModel registeredUser) {
    _box.write(AppKey.name, registeredUser.data.name);
    _box.write(AppKey.email, registeredUser.data.email);
    _box.write(AppKey.token, registeredUser.data.token);
  }

  bool isPasswordVisible = false;

  /// Toggles the visibility of the password field.
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  bool isPasswordConfirmationVisible = false;

  /// Toggles the visibility of the password confirmation field.
  void togglePasswordConfirmationVisibility() {
    isPasswordConfirmationVisible = !isPasswordConfirmationVisible;
    update();
  }

  void checked(bool value) {
    isChecked = value;
    update();
  }
}
