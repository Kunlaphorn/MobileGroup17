import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart'; // นำเข้า Product model

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ฟังก์ชันในการดึงข้อมูลสินค้าจาก Firestore
  Future<List<Product>> getProducts() async {
    try {
      // ดึงข้อมูลจาก collection 'products' ใน Firestore
      final querySnapshot = await _firestore.collection('products').get();

      // แปลงข้อมูลจาก Firestore เป็น List ของ Product
      return querySnapshot.docs.map((doc) {
        return Product.fromFirestore(
          doc.data(),
        ); // ใช้ fromFirestore เพื่อแปลงเป็น Product
      }).toList();
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }
}
