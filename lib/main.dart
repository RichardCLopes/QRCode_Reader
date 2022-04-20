import 'package:flutter/material.dart';
import 'package:leitor_qrcode/pages/qrcodepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRCode Reader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.tealAccent,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 36),
            onPrimary: Colors.black,
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: QRCodePage(),
    );
  }
}
