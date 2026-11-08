import 'routes.dart';

/// Simple data holder for one item on the menu.
class MenuItem {
  final String name;
  final String description;
  final String image;
  final String route;
  final String emoji;

  const MenuItem({
    required this.name,
    required this.description,
    required this.image,
    required this.route,
    required this.emoji,
  });
}

const List<MenuItem> menuItems = [
  MenuItem(
    name: 'Vegetable Pizza',
    description:
        'A garden-fresh pizza loaded with capsicum, mushrooms, onions, '
        'olives and sweet corn on a crispy golden crust.',
    image: 'assets/images/vegetable_pizza.png',
    route: Routes.vegetable,
    emoji: '🥦',
  ),
  MenuItem(
    name: 'Cheese Pizza',
    description:
        'The classic favourite: stretchy mozzarella melted over rich '
        'tomato sauce, baked until bubbly.',
    image: 'assets/images/cheese_pizza.png',
    route: Routes.cheese,
    emoji: '🧀',
  ),
  MenuItem(
    name: 'Box of Fries',
    description:
        'Crispy golden fries, lightly salted and served hot in a '
        'box. Perfect side for any pizza.',
    image: 'assets/images/fries.png',
    route: Routes.fries,
    emoji: '🍟',
  ),
];
