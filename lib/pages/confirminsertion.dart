// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:leitor_qrcode/pages/qrcodepage.dart';

class ConfirmInsertion extends StatefulWidget {
  String dados = '';

  ConfirmInsertion({Key? key, required this.dados}) : super(key: key);

  @override
  _ConfirmInsertionState createState() => _ConfirmInsertionState();
}

class _ConfirmInsertionState extends State<ConfirmInsertion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('ALMOXARIFADO')),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Produto: \n ${widget.dados}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 40),
            receiveNumber(),
            SizedBox(height: 40),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 36),
              child: Text(
                'Confirmar',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              color: Colors.tealAccent,
              textColor: Colors.black,
              onPressed: () {
                sendData();
              },
            )
          ],
        ),
      ),
    );
  }

  final numberController = TextEditingController();

  Widget receiveNumber() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quantidade:',
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            controller: numberController,
            decoration: InputDecoration(
              hintText: 'Quantidade',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      );

  void sendData() {
    //Mandar dados para Mensageria
    print("Enviar dados para mensageria");
  }
}
