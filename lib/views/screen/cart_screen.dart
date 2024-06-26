import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/controllers/order_controller.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/views/widgets/product_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Order order = Order(
    id: UniqueKey().toString(),
    products: [],
    dateTime: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final orderController =
        Provider.of<OrderController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cartController.cart.products.isEmpty
          ? const Center(
              child: Text("Cart is empty"),
            )
          : ListView.builder(
              itemCount: cartController.cart.products.length,
              itemBuilder: (ctx, index) {
                final product = cartController.cart.products.values
                    .toList()[index]['product'];
                order.products.add(product);
                return ChangeNotifierProvider<Product>.value(
                  value: product,
                  builder: (context, child) {
                    return const ProductItem();
                  },
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(),
        onPressed: () {
          orderController.addOrder(order);
          cartController.clearCart();
        },
        label: Text(
          "\$${cartController.cart.totalPrice}",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
