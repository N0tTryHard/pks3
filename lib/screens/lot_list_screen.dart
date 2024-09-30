import 'package:flutter/material.dart';
import '../models/lot.dart';
import '../widgets/lot_card.dart';
import 'lot_detail_screen.dart';

class LotListScreen extends StatefulWidget {
  const LotListScreen({super.key});

  @override
  _LotListScreenState createState() => _LotListScreenState();
}

class _LotListScreenState extends State<LotListScreen> {
  final List<Lot> lots = [
    Lot(
      id: 1,
      imageUrl:
          'https://static.auction.ru/offer_images/rd48/2024/09/15/09/big/T/TxLg31KUKQ1/shvejnaja_mashina_tikka_s_instrukciej_finljandija_1958_g.jpg',
      title: 'Швейная машина TIKKA, с инструкцией. Финляндия, 1958 г.',
      description:
          'Антикварная швейная машинка фирмы TIKKAKOSKI, производство Финлядия 1958 года. Состояние рабочее. Инструкция пользования. В наличии оригиналы: шпульки, иглы, кисточка, отвертка.',
      currency: '₽',
      initialPrice: 2500,
      currentPrice: 2500,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 14)),
      owner: 'Tait',
    ),
    Lot(
      id: 2,
      imageUrl:
          'https://static.auction.ru/offer_images/rd48/2024/09/14/02/big/R/RN6V3ZruwlN/brosh_sssr_v_shikarnom_kollekcionom_sostojanii_po_zolota_klejmo_dva_vida_cena_za_odnu_v_korobke.jpg',
      title:
          'Брошь СССР в шикарном коллекционом состоянии, по золота, клеймо, два вида, цена за одну в коробке',
      description:
          'Параметры:  Стиль (эпоха): 1980-90-е гг.  Страна: СССР  Маркировка (клеймо): есть  Материал: Позолота   Брошь СССР, два вида в по золоте, клеймо, бронза, не носились, шикарная в новой коробочке, цена за одну штуку в коробочке',
      currency: '₽',
      initialPrice: 1300,
      currentPrice: 1400,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 14)),
      owner: 'zolotou',
    ),
    Lot(
      id: 3,
      imageUrl:
          'https://static.auction.ru/offer_images/rd48/2023/02/15/10/big/A/AXWGRysdcJt/kuvshin_starinnyj.jpg',
      title: 'КУВШИН Старинный',
      description:
          'Параметры:  Стиль (эпоха): до 1960 г.  Страна: Германия  Материал: Другое',
      currency: '₽',
      initialPrice: 25000000,
      currentPrice: 25000000,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 7)),
      owner: 'client_9afba8ea6e',
    ),
  ];

  void _addLot() {
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
                setState(() {
                  lots.add(
                    Lot(
                      id: lots.length + 1,
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
                });
                Navigator.of(context).pop();
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  void _removeLot(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Подтвердите удаление'),
          content: const Text('Вы уверены, что хотите удалить лот?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отменить'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  lots.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Удалить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final listHeight = screenHeight * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Лоты'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addLot,
          ),
        ],
      ),
      body: SizedBox(
        height: listHeight,
        child: ListView.builder(
          itemCount: lots.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LotDetailScreen(lot: lots[index]),
                      ),
                    );
                  },
                  child: LotCard(
                    lot: lots[index],
                    onDelete: () => _removeLot(index),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
