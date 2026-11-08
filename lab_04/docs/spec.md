# Order Summary Screen - Mini-Spec

1. **Goal:** Show the customer a clear summary of their order before they leave the screen.
2. **Inputs:** `itemName` (String), `quantity` (int), `unitPrice` (double, RM).
3. **Output:** A screen in `lib/order_summary.dart` showing the item name, the quantity, and the total price formatted as `RM 0.00`.
4. **Rules:** The total must come from `orderTotal(unitPrice, quantity)` in `lib/order.dart`; the screen must include a Back button that calls `Navigator.pop`.
5. **Out of scope:** Payment, editing the cart, multiple items, and any change to files other than `lib/order_summary.dart`.
6. **Check:** `Cheese Pizza` x 2 at RM 12.50 shows `Total: RM 25.00`; `flutter analyze` has no issues and `flutter test` passes.
