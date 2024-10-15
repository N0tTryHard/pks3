import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/lot.dart';
import '../models/lot_provider.dart';
import '../widgets/lot_card.dart';
import 'lot_detail_screen.dart';

class LotListScreen extends StatelessWidget {
  const LotListScreen({super.key});

  void _addLot(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final currentPriceController = TextEditingController();
    final ownerController = TextEditingController();
    final initialPriceController = TextEditingController();
    final imageUrlController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить лот'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Название'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Описание'),
                ),
                TextField(
                  controller: currentPriceController,
                  decoration: const InputDecoration(labelText: 'Текущая цена'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ownerController,
                  decoration: const InputDecoration(labelText: 'Владелец'),
                ),
                TextField(
                  controller: initialPriceController,
                  decoration:
                      const InputDecoration(labelText: 'Начальная цена'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: imageUrlController,
                  decoration:
                      const InputDecoration(labelText: 'Ссылка на изображение'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отменить'),
            ),
            TextButton(
              onPressed: () {
                final lotProvider =
                    Provider.of<LotProvider>(context, listen: false);
                lotProvider.addLot(
                  Lot(
                    id: lotProvider.lots.length + 1,
                    title: titleController.text,
                    description: descriptionController.text,
                    currentPrice: double.parse(currentPriceController.text),
                    startDate: DateTime.now(),
                    endDate: DateTime.now().add(const Duration(days: 14)),
                    owner: ownerController.text,
                    initialPrice: double.parse(initialPriceController.text),
                    imageUrl: imageUrlController.text,
                    currency: '₽',
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final lotProvider = Provider.of<LotProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Лоты'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addLot(context),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: lotProvider.lots.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LotDetailScreen(
                    lot: lotProvider.lots[index],
                    onDelete: (id) => lotProvider.removeLot(id),
                  ),
                ),
              );
            },
            child: LotCard(
              lot: lotProvider.lots[index],
              onFavoriteToggle: () =>
                  lotProvider.toggleFavorite(lotProvider.lots[index].id),
            ),
          );
        },
      ),
    );
  }
}
