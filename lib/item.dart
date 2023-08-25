import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.title,
    required this.navigatePage,
  });

  final String title;
  final Widget navigatePage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => navigatePage),
      ),
    );
  }
}
