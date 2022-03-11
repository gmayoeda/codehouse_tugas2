import 'package:codehouse_tugas2/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokul Mokas',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(
        title: 'Jokul-Mokas',
      ),
    );
  }
}
