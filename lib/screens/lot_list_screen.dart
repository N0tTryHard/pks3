import 'package:flutter/material.dart';
import '../models/lot.dart';
import '../widgets/lot_card.dart';
import 'lot_detail_screen.dart';

class LotListScreen extends StatelessWidget {
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
        endDate: DateTime.now().add(Duration(days: 14)),
        owner: 'Tait'),
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
      endDate: DateTime.now().add(Duration(days: 14)),
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
      endDate: DateTime.now().add(Duration(days: 7)),
      owner: 'client_9afba8ea6e',
    ),
  ];

  LotListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final listHeight = screenHeight * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Лоты'),
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
                  child: LotCard(lot: lots[index]),
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
