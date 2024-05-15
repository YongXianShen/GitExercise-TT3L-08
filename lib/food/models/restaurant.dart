import 'food.dart';

class Restaurant {
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Burger",
      description: "Nice",
      imagePath: "",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "extra cheese", price: 0.99),
        Addon(name: "bacon", price: 1.99),
        Addon(name: "extra cheese", price: 0.99),
      ]
    )
  ];

  List<Food> get menu => _menu;
}