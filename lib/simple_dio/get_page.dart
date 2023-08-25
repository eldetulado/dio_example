import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetPage extends StatelessWidget {
  const GetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('GET')),
      body: FutureBuilder(
        future: _getExample(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: textTheme.bodyLarge,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<dynamic> _getExample() async {
    final response = await Dio().get('https://reqres.in/api/users/2');
    return response.data;
  }
}
