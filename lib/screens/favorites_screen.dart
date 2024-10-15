import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/lot.dart';
import '../models/lot_provider.dart';
import '../widgets/lot_card.dart';
import 'lot_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lotProvider = Provider.of<LotProvider>(context);
    final List<Lot> favoriteLots =
        lotProvider.lots.where((lot) => lot.isFavorite).toList();

    if (favoriteLots.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Избранное'),
        ),
        body: const Center(
          child: Text('Нет избранных товаров'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: favoriteLots.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LotDetailScreen(
                    lot: favoriteLots[index],
                    onDelete: (id) => lotProvider.removeLot(id),
                  ),
                ),
              );
            },
            child: LotCard(
              lot: favoriteLots[index],
              onFavoriteToggle: () =>
                  lotProvider.toggleFavorite(favoriteLots[index].id),
            ),
          );
        },
      ),
    );
  }
}
