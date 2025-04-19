import 'package:flutter/material.dart';
import 'package:ecoglam/pages/search_page.dart';
import 'package:ecoglam/pages/cart_page.dart';
import 'package:ecoglam/pages/account_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("🏠 HOME PAGE LOADED");
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: ListView(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 40, // ปรับขนาดตามต้องการ
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  const Text.rich(
                    TextSpan(
                      text: "Welcome to ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: "EcoGlam!",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search, size: 28),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/search',
                      ); // ไปที่หน้า SearchPage
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  FilterChipWidget(text: "All", isSelected: true),
                  FilterChipWidget(text: "Serum"),
                  FilterChipWidget(text: "Cream"),
                  FilterChipWidget(text: "Cleanser"),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Nature skincare",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/search',
                    ); // ใช้เส้นทางในการนำทาง
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Shop Now !",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ProductCard(
                      image: "assets/images/cen.png",
                      title: "Madagascar Centella Ampoule",
                      brand: "SKIN1004",
                      price: "฿ 478",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProductCard(
                      image: "assets/images/skin1004-005.jpg",
                      title: "Torriden Balanceful Cica Calming Serum",
                      brand: "Torriden",
                      price: "฿ 629",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/skin1004-005.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "แนะนำการใช้สกินแคร์",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/Skincare-Steps-scaled.jpg', // ตรวจสอบว่าไฟล์มีอยู่ในโฟลเดอร์ assets/images
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFEAF4C5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(
              context,
              '/home',
            ); // Navigate to HomePage
          } else if (index == 1) {
            Navigator.pushReplacementNamed(
              context,
              '/cart',
            ); // Navigate to CartPage
            // } else if (index == 2) {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => ,
            //     ), // ไม่ใช้ const ที่นี่
            //   ); // Navigate to AccountPage
          }
        },
      ),
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  final String text;
  final bool isSelected;

  const FilterChipWidget({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown[100] : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.brown),
        ),
        child: Text(widget.text, style: const TextStyle(color: Colors.brown)),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String brand;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child:
              image.startsWith('http')
                  ? Image.network(
                    image,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                  : Image.asset(
                    image,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8), // โปร่งใสเบา ๆ
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      brand,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
