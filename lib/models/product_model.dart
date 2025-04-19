class Product {
  final String name;
  final String price;
  final String image;
  final double rating;

  // Constructor
  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
  });

  // Factory constructor to create a Product from Firestore data (Map)
  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      name: data['name'] ?? '',
      price: data['price'] ?? '',
      image: data['image'] ?? '',
      rating: data['rating'] ?? 0.0,
    );
  }

  // Method to convert Product object to a map
  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price, 'image': image, 'rating': rating};
  }
}
