import 'package:flutter/material.dart';
import 'package:mmusuperapp/food/components/my_cart_tile.dart';
import 'package:mmusuperapp/food/models/restaurant.dart';
import 'package:mmusuperapp/food/pages/delivery_progress.dart';
import 'package:mmusuperapp/food/pages/payment_page.dart';
import 'package:provider/provider.dart';
 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settlement ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettlementPage(),
    );
  }
}

class SettlementPage extends StatefulWidget {
  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {
  String selectedPaymentMethod = 'Debit Card & Credit Card';
  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressController.text = context.read<Restaurant>().deliveryAddress;
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  Widget _buildCashOnDeliveryPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        SizedBox(height: 8),
        Text( '!!! You will pay with cash upon delivery. !!!'),
      ],
    );
  }

  void _navigateToPaymentPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(),
      ),
    );
  }

  void _navigateToDeliveryProgressPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryProgressPage(),
      ),
    );
  }

  void _handleCheckout() {
    if (selectedPaymentMethod == 'Debit Card & Credit Card') {
      _navigateToPaymentPage();
    } else if (selectedPaymentMethod == 'Cash on Delivery') {
      _navigateToDeliveryProgressPage();
    } else {
      print('Address: ${addressController.text}');
      print('Payment Method: $selectedPaymentMethod');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settlement'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: addressController,
              onChanged: (newAddress) {
                context.read<Restaurant>().updateDeliveryAddress(newAddress);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your address',
              ),
              maxLines: 3,
            ),
            Divider(thickness: 2, height: 32),
            
            Text(
              'Cart Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Consumer<Restaurant>(
              builder: (context, restaurant, child) {
                final userCart = restaurant.cart;
                return userCart.isEmpty 
                  ? Center(child: Text("Cart is empty..")) 
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        final cartItem = userCart[index];
                        return MyCartTile(cartItem: cartItem);
                      },
                    );
              },
            ),
            Divider(thickness: 2, height: 32),
            
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedPaymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPaymentMethod = newValue!;
                });
              },
              items: <String>['Debit Card & Credit Card', 'Cash on Delivery']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            if (selectedPaymentMethod == 'Cash on Delivery') _buildCashOnDeliveryPage(),
        
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _handleCheckout,
                child: Text('Checkout'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
