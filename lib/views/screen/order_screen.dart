import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/order_controller.dart';
import 'package:shop_app/models/order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController =
        Provider.of<OrderController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) {
            Order order = orderController.orders[index];
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              color: Colors.yellow,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(order.id),
                      Text(order.dateTime.toString()),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      order.products.length,
                      (index) => Column(
                        children: [
                          Text(order.products[index].text),
                          Text(order.products[index].price.toString()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
