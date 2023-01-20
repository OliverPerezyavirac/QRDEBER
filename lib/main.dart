import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{  
  @override
  _MyAppState createState() => _MyAppState();  
}    
class _MyAppState extends State<MyApp>{
  // ignore: non_constant_identifier_names
  String qrValue = "Oliver Pérez";
  
  void scanQr() async{
    String? cameraScanResult = await scanner.scan();
    setState(() {
      qrValue = cameraScanResult!;
    });
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escaner de código QR',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text(
            'Escaner de código QR'
          ),
        ),
        body: Center(
          child: Container(
            child: Text(
              qrValue,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          onPressed: () => scanQr(),
          child: Icon( Icons.qr_code_scanner_outlined, ),
        ),
      ),
    );
  }
}