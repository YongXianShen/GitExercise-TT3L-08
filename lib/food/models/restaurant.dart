// ignore_for_file: non_constant_identifier_names

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mmusuperapp/food/models/cart_items.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [

    Food(
      name: "Sirap",
      description: "Juicy",
      imagePath: "lib/food/images/sirap.jpg",
      price: 2.00,
      category: FoodCategory.Beverages,
      availableAddons: [
        Addon(name: "ais", price: 0.00),
        Addon(name: "hot", price: 0.00),
      ],
    ),

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
      name: "Roti Telur",
      description: "Crispy and yummy",
      imagePath: "lib/food/images/rotitelur.jpg",
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
      imagePath: "lib/food/images/rotitisu.jpg",
      price: 4.00,
      category: FoodCategory.Roti,
      availableAddons: [
        Addon(name: "extra curry", price: 1.00),
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

    Food(
      name: "Kopi",
      description: "Nice",
      imagePath: "lib/food/images/kopi.jpg",
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
      imagePath: "lib/food/images/milo.jpg",
      price: 3.00,
      category: FoodCategory.Beverages,
      availableAddons: [
        Addon(name: "ais", price: 0.50),
        Addon(name: "hot", price: 0.00),
      ],
    ),
    
  ];

  final List<CartItem> _cart = [];

  String _deliveryAddress = '';

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons = 
        const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(
        food: food, 
        selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

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

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

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

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("MMU TASTE RESTAURANT");
    receipt.writeln();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

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

  String _formatPrice(double price) {
    return "RM${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons) {
    return addons
      .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
      .join(", ");
  }
}