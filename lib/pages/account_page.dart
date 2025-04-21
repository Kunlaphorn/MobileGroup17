import 'package:flutter/material.dart';

class AccounttPage extends StatelessWidget {
  const AccounttPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF4C5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // ✅ ทำให้ปุ่มย้อนกลับทำงาน
        ),
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 12, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Account Details
              _buildIconRow(Icons.attach_money, 'Points: 120'),
              _buildIconRow(Icons.photo, 'Images: 5'),
              _buildIconRow(Icons.local_shipping, 'Orders: 3'),
              _buildIconRow(Icons.star, 'Reviews: 2'),
              const SizedBox(height: 20),

              const Text(
                'สินค้าที่ซื้อล่าสุด',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildProductItem(
                      'assets/images/dd371e0ad448a167b593581ee4380019.jpg',
                      'Name',
                      'Status',
                    ),
                    const SizedBox(width: 10),
                    _buildProductItem(
                      'assets/images/573b5df7d1348cf76478adb8936c4d46.jpg',
                      'Name',
                      'Status',
                    ),
                    const SizedBox(width: 10),
                    _buildProductItem('assets/images/in.jpg', 'Name', 'Status'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ BottomNavigationBar แก้ให้กดได้ครบ
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFEAF4C5),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/cart');
          } else if (index == 2) {
            // Do nothing - we're already on Account page
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  // Custom reusable method
  Widget _buildProductItem(String imagePath, String name, String status) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(status, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget _buildIconRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
