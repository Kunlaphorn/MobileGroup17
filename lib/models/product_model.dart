import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String image;
  final double rating;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
  });

  // สำหรับดึงข้อมูลจาก Firestore document ที่มี field 'id'
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], // ใช้ field 'id' จาก Firestore document
      name: json['name'],
      price: json['price'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      description: json['description'],
    );
  }

  // สำหรับดึงข้อมูลจาก Firestore document โดยใช้ document ID แทน field 'id'
  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id, // ใช้ document ID จาก Firestore
      name: data['name'],
      price: data['price'],
      image: data['image'],
      rating: data['rating'].toDouble(),
      description: data['description'],
    );
  }

  // สำหรับบันทึก/อัปเดตกลับไปยัง Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id, // เก็บ id ลงไปด้วย ถ้าใช้ fromJson
      'name': name,
      'price': price,
      'image': image,
      'rating': rating,
      'description': description,
    };
  }
}
