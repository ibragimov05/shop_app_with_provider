import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';

class CartController extends ChangeNotifier {
  final Cart _cart = Cart(products: {}, totalPrice: 0);

  Cart get cart => _cart;

  void addToCart(Product product) {
    if (_cart.products.containsKey(product.id)) {
      _cart.products[product.id]['amount']++;
    } else {
      _cart.products[product.id] = {
        'product': product,
        'amount': 1,
      };
    }
    calculateTotal();
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.products.containsKey(productId)) {
      if (_cart.products[productId]['amount'] == 1) {
        _cart.products.removeWhere(
          (String key, dynamic value) => key == productId,
        );
      } else {
        _cart.products[productId]['amount']--;
      }
      calculateTotal();
      notifyListeners();
    }
  }

  void calculateTotal() {
    double total = 0;
    _cart.products.forEach(
      (String key, dynamic value) {
        total += value['product'].price * value['amount'];
      },
    );
    _cart.totalPrice = total;
  }

  void clearCart(){
    _cart.products.clear();
    _cart.totalPrice = 0;
    notifyListeners();
  }


  bool isInCart(String productId) {
    return _cart.products.containsKey(productId);
  }

  int getProductAmount(String productId) {
    return _cart.products[productId]['amount'];
  }
}
