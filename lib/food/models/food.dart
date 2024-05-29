class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.description, 
    required this.imagePath, 
    required this.name, 
    required this.price,
    required this.availableAddons,
    required this.category,});
}

//food categorys
enum FoodCategory {
  Roti,
  Food,
  Beverages,
}

// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name, 
    required this.price});
}