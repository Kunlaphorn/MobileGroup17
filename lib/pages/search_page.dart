import 'package:flutter/material.dart';
import 'package:ecoglam/pages/product_page.dart'; 
import 'package:ecoglam/models/product_model.dart'; 
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
      id: '1',
      name: "centella",
      price: "129 ฿",
      image: "assets/images/dd371e0ad448a167b593581ee4380019.jpg",
      rating: 5.0,
      description: "Description for centella", 
    ),
    Product(
      id: '2',
      name: "Anua - peach 70",
      price: "319 ฿",
      image: "assets/images/573b5df7d1348cf76478adb8936c4d46.jpg",
      rating: 5.0,
      description: "Description for Anua - peach 70", 
    ),
    Product(
      id: '3',
      name: "innisfree",
      price: "219 ฿",
      image: "assets/images/in.jpg",
      rating: 5.0,
      description: "Description for innisfree", 
    ),
    Product(
      id: '4',
      name: "Dr.G",
      price: "359 ฿",
      image: "assets/images/drg.jpg",
      rating: 4.0,
      description: "Description for Dr.G", 
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
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            
                          });
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
                  childAspectRatio: 0.75, 
                ),
                itemBuilder: (context, index) {
                  final product =
                      filteredProductList[index]; 

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => ProductDetailPage(
                                product:
                                    product, 
                              ),
                        ),
                      );
                    },
                    child: Container(
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
                                        (_) =>
                                            ProductDetailPage(product: product),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  product.image,
                                  height: 150,
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
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2, 
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      product.rating.toString(),
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product.price,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
