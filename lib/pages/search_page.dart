import 'package:flutter/material.dart';
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
