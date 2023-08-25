import 'dart:developer';

import 'package:dio_example/custom_dio/custom_dio.dart';
import 'package:dio_example/custom_dio3/custom_dio3.dart';
import 'package:dio_example/simple_dio/simple_dio.dart';
import 'package:dio_example/utils/dio_client.dart';
import 'package:flutter/material.dart';

import 'item.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dio'),
        ),
        body: ListView(
          children: const [
            Item(title: 'Simple Dio', navigatePage: SimpleDioPage()),
            Item(title: 'Custom Dio', navigatePage: CustomDioPage()),
            Item(title: 'Custom Dio - Dart 3', navigatePage: CustomDio3Page()),
          ],
        ),
      ),
    );
  }
}

String message(int day) {
  return switch (day) {
    >= 1 || <= 5 => 'Trabajo muy duro como un esclavo',
    == 6 || == 7 => 'Wiiiii!!!',
    _ => 'Algo salio mal',
  };
}
