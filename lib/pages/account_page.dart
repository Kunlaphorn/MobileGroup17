import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  // ฟังก์ชันสำหรับออกจากระบบ
  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Logged out successfully')));
      Navigator.pushReplacementNamed(
        context,
        '/signin',
      ); // ไปที่หน้า SignIn หลังจากออกจากระบบ
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // ดึงข้อมูลผู้ใช้จาก Firebase
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF4C5),
        elevation: 0,
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: ListView(
            children: [
              // Profile Box
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.brown.shade200),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      user?.photoURL ?? 'assets/images/OIP.jpg',
                    ),
                    radius: 28,
                  ),
                  title: Text(
                    user?.displayName ??
                        'Jane Doe', // ถ้าผู้ใช้มีชื่อให้แสดง, ถ้าไม่มีก็ใช้ค่าเริ่มต้น
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(user?.email ?? 'jane@example.com'),
                  trailing: Icon(Icons.edit, color: Colors.brown),
                ),
              ),
              const SizedBox(height: 20),

              // Order Status Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StatusIcon(icon: Icons.attach_money, label: 'ต้องชำระ'),
                  _StatusIcon(icon: Icons.inventory, label: 'รอจัดส่ง'),
                  _StatusIcon(icon: Icons.local_shipping, label: 'รอได้รับ'),
                  _StatusIcon(icon: Icons.star_border, label: 'รีวิว'),
                ],
              ),
              const SizedBox(height: 30),

              // Recent Orders
              const Text(
                'สินค้าที่ซื้อล่าสุด',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ProductCard(
                    imagePath:
                        'assets/images/dd371e0ad448a167b593581ee4380019.jpg',
                    name: 'Madagascar Centella Ampoule',
                    price: '฿ 478',
                  ),
                  _ProductCard(
                    imagePath:
                        'assets/images/573b5df7d1348cf76478adb8936c4d46.jpg',
                    name: 'Torriden Cica Serum',
                    price: '฿ 629',
                  ),
                  _ProductCard(
                    imagePath:
                        'assets/images/dd371e0ad448a167b593581ee4380019.jpg',
                    name: 'Some by Mi Toner',
                    price: '฿ 299',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFEAF4C5),
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _logout(context),
        child: const Icon(Icons.exit_to_app),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatusIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFD0F0C0),
          child: Icon(icon, color: Colors.brown),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const _ProductCard({
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(color: Colors.green)),
        Text(price, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
