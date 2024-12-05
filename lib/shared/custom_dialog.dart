
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Shows an error dialog with the given message.
void showTextDialog(String message, bool isError, [Function()? onTap]) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      surfaceTintColor: Colors.grey,
      backgroundColor: Colors.blueGrey,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey, shape: BoxShape.circle),
                    child: const Icon(Icons.close))),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 19)
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
            backgroundColor:
                const MaterialStatePropertyAll(Colors.blue),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          onPressed: () => Get.back(),
          child: Text(
            'ok'.tr,
            style: const TextStyle(color: Colors.white,fontSize: 19)
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
