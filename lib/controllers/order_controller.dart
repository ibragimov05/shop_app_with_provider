import 'package:flutter/material.dart';
import 'package:shop_app/models/order.dart';

class OrderController extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }
}
