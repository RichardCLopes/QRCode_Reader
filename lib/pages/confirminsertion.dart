// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:leitor_qrcode/pages/qrcodepage.dart';

import 'package:leitor_qrcode/function/PostFlask.dart';

late My_QrCode myQrCode;
late String Id;
late String Produto;
late String Fabricacao;
late String Validade;
late String Lote;

class ConfirmInsertion extends StatefulWidget {
  String dados = '';

  ConfirmInsertion({Key? key, required this.dados}) : super(key: key);

  @override
  _ConfirmInsertionState createState() => _ConfirmInsertionState();
}

class _ConfirmInsertionState extends State<ConfirmInsertion> {
  @override
  Widget build(BuildContext context) {
    QuebraDoQrCode(widget.dados.split("\n"));
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('ALMOXARIFADO')),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Nome: $Produto\n'
              'Fabricacao: $Fabricacao\n'
              'Validade: $Validade\n'
              'Lote: $Lote',
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
    QuebraDoQrCode(widget.dados.split("\n"));
    myQrCode = My_QrCode(Id, Produto, Fabricacao, Validade, Lote,
        int.parse(numberController.text));
    postData(myQrCode);
  }

  void QuebraDoQrCode(List<String> StringQrCode) {
    print(StringQrCode);
    for (var i = 0; i < StringQrCode.length; i++) {
      List<String> newString = StringQrCode[i].split(': ');

      if (newString[0] == 'Id') {
        Id = newString[1];
      }
      if (newString[0] == 'Produto') {
        Produto = newString[1];
      }
      if (newString[0] == 'Fabricacao') {
        Fabricacao = newString[1];
      }
      if (newString[0] == 'Validade') {
        Validade = newString[1];
      }
      if (newString[0] == 'Lote') {
        Lote = newString[1];
      }
    }
  }
}
