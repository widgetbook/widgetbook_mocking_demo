import 'package:flutter/material.dart';
import 'package:loco_app/item_provider.dart';
import 'package:loco_app/item_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ItemProvider>(
        builder: (context, provider, child) {
          final items = provider.items;

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) => ItemTile(
              title: items[index],
            ),
          );
        },
      ),
    );
  }
}
