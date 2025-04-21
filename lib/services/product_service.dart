import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoglam/models/product_model.dart'; // ✅ Import ให้ถูก

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ✅ ดึงรายการสินค้าแบบ real-time
  Stream<List<Product>> getProducts() {
    return _firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    });
  }

  // ✅ ฟังก์ชันลบข้อมูลสินค้า
  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
      print('Product deleted successfully!');
    } catch (e) {
      print('Error deleting product: $e');
    }
  }
}
