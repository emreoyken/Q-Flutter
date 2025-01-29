import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, String>> seasons = [
    {"title": "İlkbahar", "image": "assets/icons/ilkbahar.jpg"},
    {"title": "Yaz", "image": "assets/icons/yaz.png"},
    {"title": "Sonbahar", "image": "assets/icons/sonbahar.png"},
    {"title": "Kış", "image": "assets/icons/kar.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAVSİYELER'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              color: Theme.of(context).colorScheme.surface,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Text('Günlük:',
                        style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(width: 8),
                    ChoiceChip(
                      label: Text('En Yeni'),
                      selected: true,
                      onSelected: (_) {},
                    ),
                    SizedBox(width: 8),
                    ChoiceChip(
                      label: Text('Önerilen'),
                      selected: false,
                      onSelected: (_) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: seasons.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              color: Theme.of(context).colorScheme.surfaceVariant,
                              child: Image.asset(
                                seasons[index]["image"]!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: Icon(Icons.favorite_border),
                              color: Theme.of(context).colorScheme.onSurface,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              seasons[index]["title"]!,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                           
                            SizedBox(height: 8),
                            FilledButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.cloud, size: 18),
                              label: Text('Aktiviteyi Dene'),
                              style: FilledButton.styleFrom(
                                minimumSize: Size(double.infinity, 36),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}