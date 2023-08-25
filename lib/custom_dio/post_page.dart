import 'package:dio_example/utils/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _decoration = const InputDecoration(border: OutlineInputBorder());
  final _emailCont = TextEditingController();
  final _passCont = TextEditingController();
  var _resp = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('POST')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _emailCont,
            decoration: _decoration.copyWith(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _passCont,
            decoration: _decoration.copyWith(hintText: 'Password'),
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              _resp = await _postExample({
                'email': _emailCont.text,
                'password': _passCont.text,
              });
              setState(() {});
            },
            child: const Text('Login'),
          ),
          Text(_resp, style: textTheme.bodyLarge),
        ],
      ),
    );
  }

  Future<String> _postExample(Map<String, dynamic> data) async {
    try {
      final response = await DioClient.instance.post(
        path: '/login',
        body: data,
      );
      return '$response';
    } catch (e) {
      return 'Error dio $e';
    }
  }
}
