
import 'package:flutter/material.dart';
import 'package:flutter_minimal_ecommerce_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> items = [];


  List<CartItem> get userCart {
    return items;
  }

  void addToCart(Shoe shoe) {
    final index = items.indexWhere((item) => item.shoe.id == shoe.id);
    if (index >= 0) {
      items[index].quantity += 1;
    } else {
      items.add(CartItem(shoe: shoe));
    }
    notifyListeners();

  }

  void removeItem(String shoeId) {
    items.removeWhere((item) => item.shoe.id == shoeId);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }

  double get totalCartPrice {
    return items.fold(0, (total, cartItem) => total + cartItem.totalItemPrice);
  }
}

class CartItem {
  final Shoe shoe;
  int quantity;

  CartItem({required this.shoe, this.quantity = 1});

  double get totalItemPrice => shoe.price * quantity;
}