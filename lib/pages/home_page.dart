import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ecoglam/pages/search_page.dart';
import 'package:ecoglam/pages/cart_page.dart';
import 'package:ecoglam/pages/account_page.dart';
=======
import 'package:flutter_application_1/pages/search_page.dart';

class EcoGlamApp extends StatelessWidget {
  const EcoGlamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(fontFamily: 'Arial'),
      debugShowCheckedModeBanner: false,
      routes: {'/search': (context) => const SearchPage()},
    );
  }
}
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    print("🏠 HOME PAGE LOADED");
=======
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: ListView(
            children: [
              Row(
                children: [
<<<<<<< HEAD
                  Image.asset(
                    'assets/images/logo.png',
                    width: 40, // ปรับขนาดตามต้องการ
                    height: 40,
=======
                  const Text(
                    "E\nG",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
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
<<<<<<< HEAD
                  IconButton(
                    icon: const Icon(Icons.search, size: 28),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/search',
                      ); // ไปที่หน้า SearchPage
                    },
=======
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: const Icon(Icons.search, size: 28),
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
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
<<<<<<< HEAD
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
=======
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  icon: const Icon(Icons.shopping_bag),
                  label: const Text('Shop Now!'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: const Color(0xFFD0F0C0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ProductCard(
<<<<<<< HEAD
                      image: "assets/images/cen.png",
=======
                      image:
                          "assets/images/dd371e0ad448a167b593581ee4380019.jpg",
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
                      title: "Madagascar Centella Ampoule",
                      brand: "SKIN1004",
                      price: "฿ 478",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProductCard(
<<<<<<< HEAD
                      image: "assets/images/skin1004-005.jpg",
=======
                      image:
                          "assets/images/573b5df7d1348cf76478adb8936c4d46.jpg",
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
                      title: "Torriden Balanceful Cica Calming Serum",
                      brand: "Torriden",
                      price: "฿ 629",
                    ),
                  ),
                ],
              ),
<<<<<<< HEAD
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/skin1004-005.jpg',
                  fit: BoxFit.cover,
                ),
              ),
=======

>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
              const SizedBox(height: 10),
              const Text(
                "แนะนำการใช้สกินแคร์",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
<<<<<<< HEAD
                  'assets/images/Skincare-Steps-scaled.jpg', // ตรวจสอบว่าไฟล์มีอยู่ในโฟลเดอร์ assets/images
=======
                  'assets/images/Skincare-Steps-scaled.jpg',
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
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
<<<<<<< HEAD
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
=======
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
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
<<<<<<< HEAD
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
=======
          child: Image.network(
            image,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(brand, style: const TextStyle(fontSize: 12)),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
            ],
          ),
        ),
      ],
    );
  }
}
