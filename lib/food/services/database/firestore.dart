import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  // save order to db
  Future<void> saveOrderToDatabase({
    required List<Map<String, dynamic>> food,
    required int quantity,
    required double payment,
    required String address,
  }) async {
    await orders.add({
      'date': DateTime.now(),
      'food': food,
      'quantity': quantity,
      'payment': payment,
      'address': address,
      // add more fields as necessary..
    });
  }
}
