import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';

class SignalDetailsTableWidget extends StatelessWidget {
  const SignalDetailsTableWidget({
    super.key,
  });

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
                    child: Text(
                      '0.34%',
                      style: TextStyle(color: Color(0xff3D992B)),
                      textAlign: TextAlign.center
                    ))
              ]),
          ...List.generate(
              3,
              (index) => TableRow(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xff575656)))),
                      children: [
                        const TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              'Target 1',
                              style: TextStyle(
                                  color: Colors.white,
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
                              '100.88',
                              style: TextStyle(
                                  color: const Color(0xff40ad2f),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            )),
                        const TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text(
                              '45.34%',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            )),
                      ]))
        ]);
  }
}
