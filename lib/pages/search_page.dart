import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ecoglam/pages/product_page.dart'; // นำเข้า ProductDetailPage
import 'package:ecoglam/models/product_model.dart'; // นำเข้า Product model

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  // สร้าง list ของสินค้า
  final List<Product> productList = [
    Product(
      name: "centella",
      price: "129 ฿",
      image: "assets/images/dd371e0ad448a167b593581ee4380019.jpg",
      rating: 5.0,
    ),
    Product(
      name: "Anua - peach 70",
      price: "319 ฿",
      image: "assets/images/573b5df7d1348cf76478adb8936c4d46.jpg",
      rating: 5.0,
    ),
    Product(
      name: "innisfree",
      price: "219 ฿",
      image: "assets/images/in.jpg",
      rating: 5.0,
    ),
    Product(
      name: "Dr.G",
      price: "359 ฿",
      image: "assets/images/drg.jpg",
      rating: 4.0,
    ),
  ];

  // ฟังก์ชันกรองสินค้า
  List<Product> get filteredProductList {
    if (_searchController.text.isEmpty) {
      return productList;
    } else {
      return productList
          .where(
            (product) => product.name.toLowerCase().contains(
              _searchController.text.toLowerCase(),
            ),
          )
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
=======
import 'package:flutter_application_1/pages/product_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> productList = [
      {
        "image": "assets/images/dd371e0ad448a167b593581ee4380019.jpg",
        "name": "centella",
        "price": "129 ฿",
        "rating": 5.0,
      },
      {
        "image": "assets/images/573b5df7d1348cf76478adb8936c4d46.jpg",
        "name": "Anua - peach 70",
        "price": "319 ฿",
        "rating": 5.0,
      },
      {
        "image": "https://i.imgur.com/z0v3DPd.png",
        "name": "innisfree",
        "price": "219 ฿",
        "rating": 5.0,
      },
      {
        "image": "https://i.imgur.com/wJ3jJc1.png",
        "name": "Dr.G",
        "price": "359 ฿",
        "rating": 4.0,
      },
    ];

>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F4),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: const Color(0xFFE9F3C7),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
<<<<<<< HEAD
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {}); // อัพเดทหน้าจอเมื่อมีการกรอกข้อความ
                        },
                      ),
                    ),
                  ),
                  const Icon(Icons.search),
                ],
              ),
            ),
            // Product Grid
            Expanded(
              child: GridView.builder(
                itemCount:
                    filteredProductList.length, // ใช้ filteredProductList
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75, // ปรับขนาดให้เหมาะสม
                ),
                itemBuilder: (context, index) {
                  final product =
                      filteredProductList[index]; // ใช้ filteredProductList

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: InkWell(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => ProductDetailPage(
                                        product:
                                            product, // ส่ง Product ไปที่หน้า ProductDetailPage
                                      ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child:
                                  product.image.startsWith("http")
                                      ? Image.network(
                                        product.image,
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )
                                      : Image.asset(
                                        product.image,
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2, // จำกัดจำนวนบรรทัด
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(product.rating.toString()),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
=======
                      child: const Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Icon(Icons.search),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Sort Button
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.swap_vert),
                label: const Text('Sort'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            // Product Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  itemCount: productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final product = productList[index];
                    final String image = product["image"] as String;
                    final String name = product["name"] as String;
                    final String price = product["price"] as String;
                    final double rating = product["rating"] as double;

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: InkWell(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => ProductDetailPage(
                                          image: image,
                                          name: name,
                                          price: price,
                                          rating: rating,
                                        ),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child:
                                    image.startsWith("http")
                                        ? Image.network(
                                          image,
                                          height: 440,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                        : Image.asset(
                                          image,
                                          height: 440,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(rating.toString()),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  price,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
              ),
            ),
          ],
        ),
      ),
    );
  }
}
