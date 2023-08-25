import 'package:dio_example/item.dart';
import 'package:flutter/material.dart';

import 'delete_page.dart';
import 'get_page.dart';
import 'post_page.dart';
import 'put_page.dart';

class SimpleDioPage extends StatelessWidget {
  const SimpleDioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Dio'),
      ),
      body: ListView(
        children: const [
          Item(title: 'GET', navigatePage: GetPage()),
          Item(title: 'POST', navigatePage: PostPage()),
          Item(title: 'PATCH', navigatePage: PutPage()),
          Item(title: 'DELETE', navigatePage: DeletePage()),
        ],
      ),
    );
  }
}

