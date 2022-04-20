import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ConfirmInsertion extends StatefulWidget {
  ConfirmInsertion({Key? key}) : super(key: key);

  @override
  _ConfirmInsertionSate createState() => _ConfirmInsertionSate();
}

class _ConfirmInsertionSate {
  String ticket = '';
  List<String> tickets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
