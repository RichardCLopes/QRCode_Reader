import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

fetchdata(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('http with status: ${response.statusCode}');
    return response.body;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return response.body;
  }
}

autoPost() {
  for (var i = 1; i < 11; i++) {
    My_QrCode myQrCode = My_QrCode('$i', "Produto$i", "$i$i/$i$i/$i$i$i$i",
        "$i$i/$i$i/$i$i$i$i", "$i", i * i);
    postData(myQrCode);
  }
}

postData(My_QrCode myQrCode) async {
  String url = 'http://192.168.137.1:5000/my_Post';
  var new_url = Uri.parse(url);

  http.Response response = await http.post(new_url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(myQrCode));
  if (response.statusCode == 200) {
    print('http with status: ${response.statusCode}');
    return response.statusCode;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return response.statusCode;
  }
}

MyGet() async {
  String url = 'http://192.168.137.1:5000/my_Get';
  var new_url = Uri.parse(url);
  http.Response response = await http.get(new_url);
  if (response.statusCode == 200) {
    print('http with status: ${response.statusCode}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

class My_QrCode {
  String id;
  String Produto;
  String Fabricacao;
  String Validade;
  String Lote;
  int Quantidade;

  My_QrCode(this.id, this.Produto, this.Fabricacao, this.Validade, this.Lote,
      this.Quantidade);
  Map toJson() {
    return {
      'id': id,
      'nome': Produto,
      'data_fabricacao': Fabricacao,
      'data_validade': Validade,
      'lote': Lote,
      'quantidade': Quantidade,
    };
  }
}
/*
Id: 1
Produto: Produto1
Fabricacao: 11/11/1111
Validade: 11/11/1111
Lote: 1111
*/
/*
Id: 2
Produto: Produto2
Fabricacao: 22/22/2222
Validade: 22/22/2222
Lote: 2222
*/
/*
Id: 3
Produto: Produto3
Fabricacao: 33/33/3333
Validade: 33/33/3333
Lote: 3333
*/
/*
Id: 4
Produto: Produto4
Fabricacao: 44/44/4444
Validade: 44/44/4444
Lote: 4444
*/
/*
Id: 5
Produto: Produto5
Fabricacao: 55/55/5555
Validade: 55/55/5555
Lote: 5555
*/
/*
Id: 6
Produto: Produto6
Fabricacao: 66/66/6666
Validade: 66/66/6666
Lote: 6666
*/
/*
Id: 7
Produto: Produto7
Fabricacao: 77/77/7777
Validade: 77/77/7777
Lote: 7777
*/
/*
Id: 8
Produto: Produto8
Fabricacao: 88/88/8888
Validade: 88/88/8888
Lote: 8888
*/
/*
Id: 9
Produto: Produto9
Fabricacao: 99/99/9999
Validade: 99/99/9999
Lote: 9999
*/
/*
Id: 10
Produto: Produto10
Fabricacao: 10/10/1010
Validade: 10/10/1010
Lote: 1010
*/