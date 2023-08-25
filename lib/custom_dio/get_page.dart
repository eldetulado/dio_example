import 'package:dio_example/utils/dio_client.dart';
import 'package:flutter/material.dart';

class GetPage extends StatelessWidget {
  const GetPage({super.key}) : error = false;

  const GetPage.error({super.key}) : error = true;

  final bool error;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('GET')),
      body: FutureBuilder(
        future: error ? _getExampleError() : _getExample(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: textTheme.bodyLarge,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
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
    final data = await DioClient.instance.get(
      path: '/users/3',
    );
    return data;
  }

  Future<dynamic> _getExampleError() async {
    final data = await DioClient.instance.get(
      path: '/api2/usuarios/3',
    );
    return data;
  }
}
