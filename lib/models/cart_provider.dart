import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'lot.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Lot lot) {
    final existingItem = _cartItems.firstWhere(
      (item) => item.lot.id == lot.id,
      orElse: () => CartItem(lot: lot, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++;
    } else {
      _cartItems.add(CartItem(lot: lot));
    }

    notifyListeners();
  }

  void removeFromCart(Lot lot) {
    _cartItems.removeWhere((item) => item.lot.id == lot.id);
    notifyListeners();
  }

  void incrementQuantity(Lot lot) {
    final item = _cartItems.firstWhere((item) => item.lot.id == lot.id);
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(Lot lot) {
    final item = _cartItems.firstWhere((item) => item.lot.id == lot.id);
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }

  double get totalPrice {
    return _cartItems.fold(
        0.0, (total, item) => total + item.lot.currentPrice * item.quantity);
  }
}
