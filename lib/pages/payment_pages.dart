import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // ตัวแปรสำหรับจัดการกับช่องกรอกข้อมูล
  final TextEditingController discountController = TextEditingController();

  // ตัวแปรสำหรับจัดการสถานะของการเลือกช่องชำระเงิน
  String paymentMethod = 'Credit Card';

  // ข้อมูลสินค้าที่จะถูกแสดง
  final List<Map<String, String>> orderItems = [
    {'name': 'Product A', 'brand': 'Brand X', 'quantity': '1', 'price': '199'},
    {'name': 'Product B', 'brand': 'Brand Y', 'quantity': '2', 'price': '499'},
    {'name': 'Product C', 'brand': 'Brand Z', 'quantity': '1', 'price': '150'},
  ];

  double subtotal = 848; // ตัวอย่างยอดรวมก่อนส่วนลด
  double discount = 50; // ตัวอย่างส่วนลด
  double total = 798; // ยอดรวมหลังจากส่วนลด

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.green,
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
            const Text('details', style: TextStyle(fontSize: 16)),
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
                // แค่ตัวอย่างว่าคุณสามารถใช้ฟังก์ชันนี้เพื่อใช้ส่วนลด
                setState(() {
                  if (discountController.text.isNotEmpty) {
                    discount = 100; // ตัวอย่างการใช้ส่วนลด
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
                // Handle payment logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment Successful')),
                );
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                ); // Go to Home page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
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
