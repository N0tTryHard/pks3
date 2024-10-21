import 'lot.dart';

class CartItem {
  final Lot lot;
  int quantity;

  CartItem({required this.lot, this.quantity = 1});
}
