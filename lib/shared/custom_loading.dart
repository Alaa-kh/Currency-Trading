import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoadingDialog() {
  Get.dialog(
    barrierDismissible: false,
    const PopScope(
      canPop: false,
      child: Center(child: CircularProgressIndicator()),
    ),
  );
}
