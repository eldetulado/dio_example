import 'package:dio_example/utils/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final _decoration = const InputDecoration(border: OutlineInputBorder());
  final _userIdCont = TextEditingController();
  var _resp = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('DELETE')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _userIdCont,
            decoration: _decoration.copyWith(hintText: 'User id'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              DioClient.instance.get(path: '/users');
              _resp = await _deleteExample(
                _userIdCont.text,
              );
              setState(() {});
            },
            child: const Text('Delete'),
          ),
          Text(_resp, style: textTheme.bodyLarge),
        ],
      ),
    );
  }

  Future<String> _deleteExample(String userId) async {
    try {
      final response = await Dio().delete(
        'https://reqres.in/api/users/$userId',
      );
      return '${response.statusCode}';
    } on DioException catch (e) {
      return 'Error dio $e';
    }
  }
}
