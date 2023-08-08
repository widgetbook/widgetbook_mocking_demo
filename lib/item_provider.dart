import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  List<String> get items => _items;
}
