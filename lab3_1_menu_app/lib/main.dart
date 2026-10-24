import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeMenuApp());
}

class MenuItem {
  const MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.icon,
  });

  final String name;
  final String description;
  final double price;
  final String image;
  final IconData icon;
}

const List<MenuItem> menuItems = [
  MenuItem(
    name: 'Espresso',
    description: 'Rich and bold single shot.',
    price: 6.50,
    image: 'assets/images/espresso.jpg',
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Latte',
    description: 'Smooth espresso with steamed milk.',
    price: 9.90,
    image: 'assets/images/latte.jpg',
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Cappuccino',
    description: 'Espresso topped with thick milk foam.',
    price: 9.50,
    image: 'assets/images/cappuccino.jpg',
    icon: Icons.coffee_maker,
  ),
  MenuItem(
    name: 'Butter Croissant',
    description: 'Flaky, freshly baked every morning.',
    price: 7.00,
    image: 'assets/images/croissant.jpg',
    icon: Icons.bakery_dining,
  ),
  MenuItem(
    name: 'Cheesecake',
    description: 'Creamy New York style slice.',
    price: 12.00,
    image: 'assets/images/cheesecake.jpg',
    icon: Icons.cake,
  ),
];

class CoffeeMenuApp extends StatelessWidget {
  const CoffeeMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bean There Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        scaffoldBackgroundColor: const Color(0xFFF5ECE0),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade700,
        foregroundColor: Colors.white,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.coffee),
            SizedBox(width: 8),
            Text('Bean There Cafe'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.brown.shade200,
            child: const Text(
              "Today's Menu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E2723),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: menuItems.length,
              itemBuilder: (context, index) => MenuCard(item: menuItems[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 90,
                  height: 90,
                  color: Colors.brown.shade100,
                  child: Icon(item.icon, size: 40, color: Colors.brown),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(item.icon, size: 18, color: Colors.brown),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'RM ${item.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
