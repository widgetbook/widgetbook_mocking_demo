import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'item_provider.dart';

void main() {
  runApp(const LocoApp());
}

class LocoApp extends StatelessWidget {
  const LocoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ItemProvider(),
        child: const HomePage(),
      ),
    );
  }
}
