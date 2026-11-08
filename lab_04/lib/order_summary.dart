import 'package:flutter/material.dart';

import 'order.dart';

/// Order Summary Screen: shows item name, quantity and total price.
class OrderSummaryScreen extends StatelessWidget {
  final String itemName;
  final int quantity;
  final double unitPrice;

  const OrderSummaryScreen({
    super.key,
    this.itemName = 'Cheese Pizza',
    this.quantity = 2,
    this.unitPrice = 12.50,
  });

  @override
  Widget build(BuildContext context) {
    final total = orderTotal(unitPrice, quantity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemName,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text('Quantity: $quantity',
                        style: const TextStyle(fontSize: 18)),
                    const Divider(height: 32),
                    Text('Total: RM ${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
