import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_provider.dart';
import '../models/lot.dart';

class LotDetailScreen extends StatelessWidget {
  final Lot lot;
  final Function(int) onDelete;

  const LotDetailScreen({super.key, required this.lot, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(lot.id.toString().padLeft(8, '0')),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Удалить лот'),
                    content: const Text('Вы уверены, что хотите удалить этот лот?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Отменить'),
                      ),
                      TextButton(
                        onPressed: () {
                          onDelete(lot.id);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Удалить'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(lot.imageUrl),
            ),
            const SizedBox(height: 8.0),
            Text(
              lot.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Описание:\n ${lot.description}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Начало аукциона: ${lot.startDate.day}-${lot.startDate.month}-${lot.startDate.year}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Конец аукциона: ${lot.endDate.day}-${lot.endDate.month}-${lot.endDate.year}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Начальная цена: ${lot.initialPrice}${lot.currency}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Текущая цена: ${lot.currentPrice}${lot.currency}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Владелец: ${lot.owner}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cartProvider.addToCart(lot);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Товар добавлен в корзину')),
                    );
                  },
                  child: const Text('Добавить в корзину'),
                ),
                ElevatedButton(
                  onPressed: () {
                    lot.isFavorite = !lot.isFavorite;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          lot.isFavorite ? 'Товар добавлен в избранное' : 'Товар удален из избранного',
                        ),
                      ),
                    );
                  },
                  child: Text(lot.isFavorite ? 'Удалить из избранного' : 'Добавить в избранное'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
