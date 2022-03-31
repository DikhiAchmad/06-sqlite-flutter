import 'package:flutter/material.dart';
//2031710159 Dikhi Achmad Dani
import 'package:praktikum6/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Home(),
    );
  }
} //2031710159 Dikhi Achmad Dani
