class itemlist {
  final String image;
  final String name;
  final String category;
  final int price;
  final double rate;

  itemlist(
      {required this.image,
      required this.name,
      required this.price,
      required this.rate,
      required this.category});

  static List<itemlist> categoryList = [];
  static int finalTotal = 0;
}

List<itemlist> Menu = [
  itemlist(
    name: 'Magreta Pizza',
    image: 'assets/dish1.png',
    price: 100,
    rate: 4.5,
    category: 'Full',
  ),
  itemlist(
    name: 'VegetablePizza',
    image: 'assets/dish2.png',
    price: 150,
    rate: 4.5,
    category: 'Full',
  ),
  itemlist(
    name: 'Burger',
    image: 'assets/dish3.png',
    price: 80,
    rate: 4.3,
    category: 'Single',
  ),
  itemlist(
    name: 'Burger with \n french fries',
    image: 'assets/dish4.png',
    price: 120,
    rate: 4.7,
    category: 'Meal',
  ),
  itemlist(
    name: 'Garlic bread',
    image: 'assets/dish5.png',
    price: 130,
    rate: 4.4,
    category: 'Full',
  ),
  itemlist(
    name: 'Momos',
    image: 'assets/dish6.png',
    price: 90,
    rate: 4.6,
    category: 'Full',
  ),
  itemlist(
    name: 'Fafda jalebi',
    image: 'assets/dish7.png',
    price: 150,
    rate: 4.8,
    category: 'Full',
  ),
];
