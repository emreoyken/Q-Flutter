import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, // Arka plan rengi temaya bağlı
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar.large(
                floating: true,
                pinned: true,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer, // Temaya uygun AppBar
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Arama yap...",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSurface),
                  ),
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Son Aramalar",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 16),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SearchResultItem(title: "İstanbul"),
                          SearchResultItem(title: "Adana"),
                          SearchResultItem(title: "Ankara"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final String title;

  const SearchResultItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.history, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).colorScheme.onSurface),
        onTap: () {},
      ),
    );
  }
}
