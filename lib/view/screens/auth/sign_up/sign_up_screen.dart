import 'package:currency_trading/logic/controllers/auth/register_controller.dart';
import 'package:currency_trading/shared/custom_button_widget.dart';
import 'package:currency_trading/shared/custom_textfield.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/utils/validators/forms_validators.dart';
import 'package:currency_trading/view/screens/auth/login/login_screen.dart';
import 'package:currency_trading/view/widgets/auth_appbar_function.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/title_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterControllerImpl());

    return Scaffold(
        // appBar: authAppBar(),
        body: Container(
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: GetBuilder<RegisterControllerImpl>(
                      builder: (_) => Form(
                        key: controller.formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(ImagesAssets.logoImage,
                                  width: 150),
                              const CustomVerticalSizedox(height: 20),
                              const TitleTextFieldWidget(title: 'Name '),
                              const CustomVerticalSizedox(height: 10),
                              CustomTextField(
                                validator: (name) =>
                                    FormsValidate.getNameValidate(
                                        context, name),
                                controller: controller.nameController,
                                prefixIcon: Image.asset(IconsAssets.nameIcon
                                )  ),
                              const CustomVerticalSizedox(height: 20),
                              const TitleTextFieldWidget(title: 'Email '),
                              const CustomVerticalSizedox(height: 10),
                              CustomTextField(
                                  validator: (email) =>
                                      FormsValidate.getEmailValidate(
                                          context, email),
                                  controller: controller.emailController,
                                  prefixIcon:Image.asset( IconsAssets.emailIcon)),
                              const CustomVerticalSizedox(height: 20),
                              const TitleTextFieldWidget(
                                  title: 'Password '),
                              const CustomVerticalSizedox(height: 10),
                              CustomTextField(
                                  controller: controller.passwordController,
                                  validator: (password) =>
                                      FormsValidate.getPasswordValidate(
                                          context, password,
                                          isFillOldPassword: true),
                                  suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                          IconsAssets.eyeIcon,
                                          width: 3,
                                          height: 3,
                                          color: const Color(0xff8e711c))),
                                  prefixIcon: Image.asset(IconsAssets.passwordIcon)),
                              const CustomVerticalSizedox(height: 20),
                              const TitleTextFieldWidget(
                                  title: 'Confirm aPassword '),
                              const CustomVerticalSizedox(height: 10),
                              CustomTextField(
                                  validator: (confirmPassword) =>
                                      FormsValidate.getConfPasswordValidate(
                                          context, confirmPassword),
                                  controller: controller
                                      .passwordConfirmationController,
                                  prefixIcon:Image.asset( IconsAssets.passwordIcon),
                                  suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                          IconsAssets.eyeIcon,
                                          width: 3,
                                          height: 3,
                                          color: const Color(0xff8e711c)))),
                              const CustomVerticalSizedox(height: 20),
                              const TitleTextFieldWidget(
                                  title: 'Invitation Code '),
                              const CustomVerticalSizedox(height: 10),
                              CustomTextField(
                                  controller:
                                      controller.inviteCodeController,
                                  prefixIcon:
                                  Image.asset(    IconsAssets.invitationCodeIcon)),
                              Row(children: [
                                Checkbox(
                                  side: const BorderSide(
                                      color: Color(0xff929292)),
                                  hoverColor: const Color(0xff929292),
                                  activeColor: const Color(0xff929292),
                                  focusColor: const Color(0xff929292),
                                  fillColor: WidgetStateProperty.all(
                                      const Color(0xff929292)),
                                  value: controller.isChecked,
                                  onChanged: (bool? value) {
                                    controller.checked(value!);
                                  },
                                ),
                                RichText(
                                    text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        text: 'I agree ',
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                              color: Color(0xfff2b80d)))
                                    ]))
                              ]),
                              const CustomVerticalSizedox(height: 15),
                              CustomButtonWidget(
                                  text: 'Sign up',
                                  onTap: () {
                                    if (controller.isChecked) {
                                      return controller.registerUser();
                                    } else {
                                      Get.snackbar('Note',
                                          'You must agree to the Privacy Policy',
                                          backgroundColor: Colors.red);
                                    }
                                  }),
                              const CustomVerticalSizedox(height: 20),
                              GestureDetector(
                                  onTap: () =>
                                      Get.to(() => const LoginScreen()),
                                  child: RichText(
                                      text: const TextSpan(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          text: 'Have an account? ',
                                          children: <TextSpan>[
                                        TextSpan(
                                            text: 'Log In',
                                            style: TextStyle(
                                                color: Color(0xfff2b80d)))
                                      ]))),
                              const CustomVerticalSizedox(height: 20)
                            ]),
                      ),
                    )))));
  }
}
