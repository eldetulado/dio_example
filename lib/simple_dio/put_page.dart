import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  final _decoration = const InputDecoration(border: OutlineInputBorder());
  final _nameCont = TextEditingController();
  final _userIdCont = TextEditingController();
  var _resp = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('PUT')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _userIdCont,
            decoration: _decoration.copyWith(hintText: 'User id'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _nameCont,
            decoration: _decoration.copyWith(hintText: 'Name'),
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              _resp = await _patchExample(
                _userIdCont.text,
                {'name': _nameCont.text},
              );
              setState(() {});
            },
            child: const Text('Update'),
          ),
          Text(_resp, style: textTheme.bodyLarge),
        ],
      ),
    );
  }

  Future<String> _patchExample(String userId, Map<String, dynamic> data) async {
    try {
      final response = await Dio().patch(
        'https://reqres.in/api/users/$userId',
        data: data,
      );
      return '${response.data}';
    } on DioException catch (e) {
      return 'Error dio $e';
    }
  }
}
