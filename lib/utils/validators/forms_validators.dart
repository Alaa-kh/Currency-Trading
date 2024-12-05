import 'package:currency_trading/core/helper/check_forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//* Helper class for validating various form inputs such as name, email, password, and phone number.
class FormsValidate {
  static String? _oldPassword = '';

  //* Validates the 'name' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getNameValidate(BuildContext context, String name) {
    if (!CheckForms.checkEmpty(name)) {
      return 'requiredField'.tr;
    }

    if (name.length < 3) {
      return 'nameInvalid'.tr;
    }

    return null;
  }

  //* Validates the 'email' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getEmailValidate(BuildContext context, String email) {
    if (!CheckForms.checkEmpty(email)) {
      return 'requiredField'.tr;
    }

    if (!CheckForms.checkEmailRegex(email)) {
      return 'emailInvalid'.tr;
    }

    return null;
  }

  //* Validates the 'password' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getPasswordValidate(BuildContext context, String password,
      {bool? isFillOldPassword}) {
    if (!CheckForms.checkEmpty(password)) {
      return 'requiredField'.tr;
    }

    if (password.length < 8) {
      return 'passwordInvalid'.tr;
    }

    if (isFillOldPassword != null && isFillOldPassword) {
      _oldPassword = password;
    }

    return null;
  }

  //* Validates the 'confirm password' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getConfPasswordValidate(
      BuildContext context, String password) {
    if (!CheckForms.checkEmpty(password)) {
      return 'requiredField'.tr;
    }

    if (password != _oldPassword) {
      return 'passwordsNotMatch'.tr;
    }

    return null;
  }

  //* Validates fields that should not be empty.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getEmptyValidate(BuildContext context, String value) {
    if (!CheckForms.checkEmpty(value)) {
      return 'requiredField'.tr;
    }

    return null;
  }

  //* Validates the 'phone number' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getPhoneNumberValidate(
      BuildContext context, String phoneNumber) {
    if (!CheckForms.checkEmpty(phoneNumber)) {
      return 'requiredField'.tr;
    }

    if (!CheckForms.checkPhoneNumberRegex(phoneNumber)) {
      return 'numberInvalid'.tr;
    }

    return null;
  }
}
