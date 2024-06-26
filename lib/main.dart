import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/controllers/order_controller.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/views/screen/home_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartController(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderController(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amberAccent,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
