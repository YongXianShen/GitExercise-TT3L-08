// ignore_for_file: non_constant_identifier_names

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mmusuperapp/food/models/cart_items.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //Roti
    Food(
      name: "Roti Canai",
      description: "Crispy and yummy",
      imagePath: "lib/food/images/roti-canai-roti-paratha-roti-prata.webp",
      price: 2.50,
      category: FoodCategory.Roti,
      availableAddons: [
        Addon(name: "extra curry", price: 1.00),
        Addon(name: "with cutlery", price: 0.50),
        Addon(name: "with one package teh tarik", price: 1.50),
      ],
    ),
    Food(
      name: "Roti Telur",
      description: "Crispy and yummy",
      imagePath: "lib/food/images/roti-canai-roti-paratha-roti-prata.webp",
      price: 3.00,
      category: FoodCategory.Roti,
      availableAddons: [
        Addon(name: "extra curry", price: 1.00),
        Addon(name: "with cutlery", price: 0.50),
        Addon(name: "with one package teh tarik", price: 1.50),
      ],
    ),
    Food(
      name: "Roti Tisu",
      description: "Crispy and yummy",
      imagePath: "lib/food/images/roti-canai-roti-paratha-roti-prata.webp",
      price: 4.00,
      category: FoodCategory.Roti,
      availableAddons: [
        Addon(name: "extra curry", price: 1.00),
        Addon(name: "with cutlery", price: 0.50),
        Addon(name: "with one package teh tarik", price: 1.50),
      ],
    ),

    // Food
    Food(
      name: "Nasi Lemak Biasa",
      description: "Yummy",
      imagePath: "lib/food/images/Untitled.jpeg",
      price: 4.00,
      category: FoodCategory.Food,
      availableAddons: [
        Addon(name: "extra sambal", price: 1.00),
        Addon(name: "with cutlery", price: 0.50),
        Addon(name: "with one package teh tarik", price: 1.50),
      ],
    ),
    Food(
      name: "Nasi Lemak Ayam Goreng",
      description: "Yummy",
      imagePath: "lib/food/images/Untitled.jpeg",
      price: 7.00,
      category: FoodCategory.Food,
      availableAddons: [
        Addon(name: "extra sambal", price: 1.00),
        Addon(name: "with cutlery", price: 0.50),
        Addon(name: "with one package teh tarik", price: 1.50),
      ],
    ),
    Food(
      name: "Nasi Lemak Sotong",
      description: "Yummy",
      imagePath: "lib/food/images/Untitled.jpeg",
      price: 9.00,
      category: FoodCategory.Food,
      availableAddons: [
        Addon(name: "extra sambal", price: 1.00),
        Addon(name: "with cutlery", price: 0.50),
        Addon(name: "with one package teh tarik", price: 1.50),
      ],
    ),

    //Beverages
    Food(
      name: "Teh Tarik",
      description: "Juicy",
      imagePath: "lib/food/images/Untitled1.jpeg",
      price: 2.00,
      category: FoodCategory.Beverages,
      availableAddons: [
        Addon(name: "ais", price: 0.50),
        Addon(name: "hot", price: 0.00),
      ],
    ),
    Food(
      name: "Kopi",
      description: "Nice",
      imagePath: "lib/food/images/Untitled1.jpeg",
      price: 2.00,
      category: FoodCategory.Beverages,
      availableAddons: [
        Addon(name: "ais", price: 0.50),
        Addon(name: "hot", price: 0.00),
      ],
    ),
    Food(
      name: "Milo",
      description: "Good",
      imagePath: "lib/food/images/Untitled1.jpeg",
      price: 3.00,
      category: FoodCategory.Beverages,
      availableAddons: [
        Addon(name: "ais", price: 0.50),
        Addon(name: "hot", price: 0.00),
      ],
    ),
    Food(
      name: "Sirap",
      description: "Juicy",
      imagePath: "lib/food/images/Untitled1.jpeg",
      price: 2.00,
      category: FoodCategory.Beverages,
      availableAddons: [
        Addon(name: "ais", price: 0.00),
        Addon(name: "hot", price: 0.00),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivery address (which user can change/update)
  String _deliveryAddress = '';

  /* 
  
  G E T T E R S

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*

  O P E R A T I O N S

  */

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = 
        const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise, add a new cart item to the cart
    else {
      _cart.add(CartItem(
        food: food, 
        selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /* 
  
  H E L P E R S 
  
  */
  Map<String, dynamic> generateOrderData() {
    List<Map<String, dynamic>> foodList = _cart.map((cartItem) {
      return {
        'name': cartItem.food.name,
        'price': cartItem.food.price,
        'addons': cartItem.selectedAddons.map((addon) => addon.name).toList(),
        'quantity': cartItem.quantity,
      };
    }).toList();

    return {
      'food': foodList,
      'quantity': getTotalItemCount(),
      'payment': getTotalPrice(),
      'address': _deliveryAddress,
    };
  }
  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("MMU TASTE RESTAURANT");
    receipt.writeln();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate = 
      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------------------------------------------------------------------");

    for (final CartItem in _cart) {
      receipt.writeln(
        "${CartItem.quantity} x ${CartItem.food.name} - ${_formatPrice(CartItem.food.price)}");
      if (CartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddons(CartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-----------------------------------------------------------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "RM${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
      .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
      .join(", ");
  }
}