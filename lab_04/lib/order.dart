/// Pure business logic for orders (no UI here).
///
/// Returns the total price for [quantity] items at [unitPrice] each.
double orderTotal(double unitPrice, int quantity) {
  if (unitPrice < 0 || quantity < 0) {
    throw ArgumentError('unitPrice and quantity must not be negative');
  }
  return unitPrice * quantity;
}
