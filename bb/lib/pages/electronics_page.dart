import 'package:flutter/material.dart';

class ElectronicsPage extends StatelessWidget {
  const ElectronicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A3A47),
        title: const Text(
          'Electronics',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF1E2833),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5, // Örnek ürün sayısı
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF2A3A47),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ürün görseli
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/electronics.jpg'), // Örnek ürün görseli
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Ürün bilgisi ve butonlar
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '\$100',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Satın alma işlemi
                                print('Product ${index + 1} bought!');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                              ),
                              child: const Text('Buy'),
                            ),
                            // Like ve Dislike butonları
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.thumb_up, color: Colors.green),
                                  onPressed: () {
                                    // Like işlemi
                                    print('Product ${index + 1} liked!');
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.thumb_down, color: Colors.red),
                                  onPressed: () {
                                    // Dislike işlemi
                                    print('Product ${index + 1} disliked!');
                                  },
                                ),
                              ],
                            ),
                          ],
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
    );
  }
}
