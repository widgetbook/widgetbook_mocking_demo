import 'package:flutter/material.dart';
import 'package:loco_app/home_page.dart';
import 'package:loco_app/item_provider.dart';
import 'package:loco_app/item_tile.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
          ],
        )
      ],
      directories: [
        WidgetbookComponent(
          name: 'Item Tile',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return ItemTile(
                  title: context.knobs.string(
                    label: 'Title',
                    initialValue: 'Item Title',
                  ),
                );
              },
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Home Page',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return ChangeNotifierProvider<ItemProvider>(
                  create: (_) {
                    final provider = MockItemProvider();

                    when(() => provider.items).thenReturn(
                      [
                        'Mocked Item 1',
                        'Mocked Item 2',
                      ],
                    );

                    return provider;
                  },
                  child: HomePage(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class MockItemProvider extends Mock implements ItemProvider {}
