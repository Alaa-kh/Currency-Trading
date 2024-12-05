import 'package:flutter/material.dart';

class HistoryCardsGridViewWidget extends StatelessWidget {
  const HistoryCardsGridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 120,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15),
            itemCount: 6,
            itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffFF0004), width: 2),
                    color: const Color(0xff383F76),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                    blurRadius: 20,
                                    color: Color.fromARGB(255, 156, 155, 155))
                              ], borderRadius: BorderRadius.circular(11)),
                              child: Text('Buy',
                                  style: const TextStyle(
                                      color: Color(0xff00A7FF),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19))),
                          Text('04-11-2024 12:40Am',
                              style: const TextStyle(
                                  color: Color(0xffA7A7A7), fontSize: 9)),
                          RichText(
                              text: TextSpan(
                                  text: 'Win',
                                  style: const TextStyle(
                                      color: Color(0xff00FF09), fontSize: 12),
                                  children: <TextSpan>[
                                const TextSpan(
                                    text: '   -   ',
                                    style: TextStyle(color: Colors.white)),
                                TextSpan(
                                    text: 'Stop 1111',
                                    style: const TextStyle(
                                      color: Color(0xffFF0004),
                                    )),
                              ]))
                        ])))));
  }
}
