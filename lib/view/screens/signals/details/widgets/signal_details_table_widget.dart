import 'package:flutter/material.dart';

class SignalDetailsTableWidget extends StatelessWidget {
  const SignalDetailsTableWidget({
    super.key,
    required this.currentPrice,
    required this.number,
    required this.ratio,
    required this.index,
  });
  final String currentPrice;
  final String number;
  final String ratio;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(
            color: Colors.grey.shade800,
            width: 1.0,
            borderRadius: BorderRadius.circular(16)),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
              decoration: const BoxDecoration(
                  color: Color(0xff23252F),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: EdgeInsets.only(top: 22, bottom: 22),
                        child: Text(
                          'Current Price',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      '1.878',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text('0.34%',
                        style: TextStyle(color: Color(0xff3D992B)),
                        textAlign: TextAlign.center))
              ]),
          ...List.generate(
              index,
              (index) => TableRow(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xff575656)))),
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              currentPrice,
                              style: TextStyle(
                                  color: index == 0 || index == 1
                                      ? const Color(0xff40ad2f)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text(
                              number.toString(),
                              style: TextStyle(
                                  color: index == 0 || index == 1
                                      ? const Color(0xff40ad2f)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text(
                              '${ratio.toString()}%',
                              style: TextStyle(
                                  color: index == 0 || index == 1
                                      ? const Color(0xff40ad2f)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            )),
                      ]))
        ]);
  }
}
