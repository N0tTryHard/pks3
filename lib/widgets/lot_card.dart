import 'package:flutter/material.dart';
import '../models/lot.dart';

class LotCard extends StatelessWidget {
  final Lot lot;
  final VoidCallback onFavoriteToggle;

  const LotCard({super.key, required this.lot, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardSize = screenWidth / 2 - 24.0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: cardSize,
        height: cardSize * 1.5,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SizedBox(
                    width: cardSize * 0.7,
                    height: cardSize * 0.7,
                    child: Image.network(lot.imageUrl))),
            Text(
                lot.title.length > 50
                    ? '${lot.title.substring(0, 50)}...'
                    : lot.title,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  lot.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: lot.isFavorite ? Colors.red : null,
                ),
                onPressed: onFavoriteToggle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
