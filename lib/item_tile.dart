import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      tileColor: Colors.yellow,
    );
  }
}
