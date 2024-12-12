import 'package:flutter/material.dart';

class MainCircularProgresswidget extends StatelessWidget {
  const MainCircularProgresswidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: Color(0xffF2B80C),
      backgroundColor: Color(0xff454545),
    ));
  }
}
