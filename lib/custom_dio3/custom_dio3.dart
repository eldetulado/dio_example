import 'package:dio_example/item.dart';
import 'package:flutter/material.dart';

import 'get_page.dart';

class CustomDio3Page extends StatelessWidget {
  const CustomDio3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Dio - Dart 3'),
      ),
      body: ListView(
        children: const [
          Item(title: 'GET', navigatePage: GetPage()),
          Item(title: 'GET - Error', navigatePage: GetPage.error()),
        ],
      ),
    );
  }
}

