import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A3A47),
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF1E2833),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 3, // Örnek ürün sayısı
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF2A3A47),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.yellow[700]),
              title: Text(
                'Product ${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Quantity: 1',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Ürün silme işlemi
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: const Color(0xFF2A3A47),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total: \$100',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Satın alma işlemi
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
