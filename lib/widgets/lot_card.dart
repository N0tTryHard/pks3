import 'package:flutter/material.dart';
import '../models/lot.dart';

class LotCard extends StatelessWidget {
  final Lot lot;
  final VoidCallback onDelete;

  const LotCard({super.key, required this.lot, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardSize = screenWidth;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: cardSize,
        height: cardSize,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SizedBox(
                    width: cardSize * 0.4,
                    height: cardSize * 0.4,
                    child: Image.network(lot.imageUrl))),
            const SizedBox(height: 8.0),
            Text(
                lot.title.length > 50
                    ? '${lot.title.substring(0, 50)}...'
                    : lot.title,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Текущая цена: ${lot.currentPrice}${lot.currency}',
                style: const TextStyle(fontSize: 14)),
            Text('Конец аукциона: ${lot.endDate.day}-${lot.endDate.month}-${lot.endDate.year}',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8.0),
            Text(
              lot.description.length > 50
                  ? '${lot.description.substring(0, 60)}...'
                  : lot.description,
              style: const TextStyle(fontSize: 14),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
