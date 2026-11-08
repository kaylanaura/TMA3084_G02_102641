import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/order.dart';
import 'package:lab_04/order_summary.dart';

void main() {
  test('orderTotal multiplies price by quantity', () {
    expect(orderTotal(12.50, 2), 25.00);
  });

  testWidgets('shows correct name, quantity and total (RM 25.00)',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: OrderSummaryScreen(
          itemName: 'Cheese Pizza', quantity: 2, unitPrice: 12.50),
    ));

    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('Total: RM 25.00'), findsOneWidget);
  });

  testWidgets('Back button pops the screen', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const OrderSummaryScreen())),
            child: const Text('open'),
          ),
        ),
      ),
    ));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.byType(OrderSummaryScreen), findsOneWidget);

    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    expect(find.byType(OrderSummaryScreen), findsNothing);
  });
}
