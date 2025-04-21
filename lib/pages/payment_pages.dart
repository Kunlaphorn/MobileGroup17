import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController discountController = TextEditingController();
  String paymentMethod = 'Credit Card';

  // รับข้อมูลสินค้าที่ส่งมาจาก CartPage
  List<Map<String, dynamic>> orderItems = [];

  // คำนวณยอดรวมต่างๆ
  double subtotal = 0.0;
  double discount = 0.0;
  double total = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments
            as List<Map<String, dynamic>>?;
    if (args != null) {
      setState(() {
        orderItems = args;

        // คำนวณ subtotal
        subtotal = orderItems.fold(0.0, (sum, item) {
          return sum +
              (double.parse(item['price']!.replaceAll('฿', '').trim()) *
                  item['quantity']);
        });

        total = subtotal - discount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F4),
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: const Color(0xFFEAF4C5),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // ที่อยู่
            const Text(
              'Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Order Summary
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children:
                  orderItems.map((item) {
                    return ListTile(
                      title: Text('${item['name']} (${item['brand']})'),
                      subtitle: Text('Quantity: ${item['quantity']}'),
                      trailing: Text('฿${item['price']}'),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 16),

            // Payment Method
            const Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Credit Card',
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                ),
                const Text('Credit Card'),
                Radio<String>(
                  value: 'QR code',
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                ),
                const Text('QR Code'),
              ],
            ),
            const SizedBox(height: 16),

            // Discount Code
            const Text(
              'Discount Code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: discountController,
              decoration: InputDecoration(
                hintText: 'Enter discount code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (discountController.text.isNotEmpty) {
                    discount = 100; // ใช้ตัวอย่างส่วนลด
                    total = subtotal - discount;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEAC78C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Apply Discount'),
            ),
            const SizedBox(height: 16),

            // Summary (Subtotal, Discount, Total)
            const Text(
              'Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Subtotal'),
              trailing: Text('฿$subtotal'),
            ),
            ListTile(
              title: const Text('Discount'),
              trailing: Text('-฿$discount'),
            ),
            ListTile(title: const Text('Total'), trailing: Text('฿$total')),
            const SizedBox(height: 16),

            // Payment Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment Successful')),
                );
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                ); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF81B971),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                'Pay Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
