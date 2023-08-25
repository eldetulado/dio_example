import 'package:dio_example/item.dart';
import 'package:flutter/material.dart';

import 'get_page.dart';
import 'post_page.dart';

class CustomDioPage extends StatelessWidget {
  const CustomDioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Dio'),
      ),
      body: ListView(
        children: const [
          Item(title: 'GET', navigatePage: GetPage()),
          Item(title: 'GET - Error', navigatePage: GetPage.error()),
          Item(title: 'POST', navigatePage: PostPage()),
        ],
      ),
    );
  }
}
