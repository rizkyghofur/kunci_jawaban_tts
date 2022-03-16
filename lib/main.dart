import 'package:flutter/material.dart';
import 'package:kunci_jawaban_tts/pages/Beranda.dart';
import 'package:kunci_jawaban_tts/utils/Injector.dart';

void main() async {
  await baseDio();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kunci Jawaban Teka Teki Silang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Beranda(),
      debugShowCheckedModeBanner: false,
    );
  }
}
