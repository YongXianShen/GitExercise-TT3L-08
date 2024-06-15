import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

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
    });
  }
}
