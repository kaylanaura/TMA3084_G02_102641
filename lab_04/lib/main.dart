import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'menu_item.dart';
import 'menu_screen.dart';
import 'order_summary.dart';
import 'routes.dart';

void main() => runApp(const PizzaStoreApp());

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: Routes.menu,
      routes: {
        Routes.menu: (_) => const MenuScreen(),
        Routes.vegetable: (_) => DetailScreen(item: menuItems[0]),
        Routes.cheese: (_) => DetailScreen(item: menuItems[1]),
        Routes.fries: (_) => DetailScreen(item: menuItems[2]),
        Routes.orderSummary: (_) => const OrderSummaryScreen(),
      },
    );
  }
}
