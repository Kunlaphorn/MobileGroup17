import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/search_page.dart';
import 'pages/search_page.dart';

void main() => runApp(const EcoGlamApp());

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: ListView(
            children: [
              Row(
                children: [
                  const Text(
                    "E\nG",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
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
                  Icon(Icons.search, size: 28),
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
                      image: "https://via.placeholder.com/150",
                      title: "Madagascar Centella Ampoule",
                      brand: "SKIN1004",
                      price: "฿ 478",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProductCard(
                      image: "https://via.placeholder.com/150/green",
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
                child: Image.network(
                  "https://via.placeholder.com/350x120",
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
            ],
          ),
        ),
      ],
    );
  }
}
