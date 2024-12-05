import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_copy_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignalDetailsTotalListWidget extends StatelessWidget {
  const SignalDetailsTotalListWidget({
    super.key,
    this.icon,
    required this.title,
    required this.total,
  });

  final String? icon;
  final String title;
  final String total;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: icon != null
            ? InkWell(
                onTap: () {
                  signalDetailsDialog();
                },
                child: Image.asset(icon!))
            : const SizedBox(),
        title: Text(
          total,
          style: const TextStyle(color: Color(0xffF2B80C)),
          textAlign: TextAlign.end,
        ),
        leading: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 14)));
  }

  Future<dynamic> signalDetailsDialog() {
    return Get.dialog(
        barrierDismissible: false,
        AlertDialog(
            backgroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle),
                        child: const Icon(Icons.close,
                            color: Colors.white, size: 10)),
                    onPressed: () {
                      Get.back();
                    },
                  )),
              SizedBox(
                width: 500,
                height: 500,
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 18),
                    itemCount: 7,
                    itemBuilder: (context, index) =>
                        SignalDetailsCopyDialogWidget(
                            icon: IconsAssets.entryIcon,
                            title: 'ENTRY',
                            number: '0.0223')),
              )
            ])));
  }
}
