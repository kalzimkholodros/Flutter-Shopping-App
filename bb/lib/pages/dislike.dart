import 'package:flutter/material.dart';

class DislikePage extends StatelessWidget {
  const DislikePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dislikedProducts = [
      'Product 2',
      'Product 4',
    ]; // Beğenilmeyen ürünlerin örnek listesi

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A3A47),
        title: const Text(
          'Disliked Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF1E2833),
      body: dislikedProducts.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: dislikedProducts.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF2A3A47),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.thumb_down,
                      color: Colors.red,
                      size: 40,
                    ),
                    title: Text(
                      dislikedProducts[index],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: const Text(
                      'This product was disliked!',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'No disliked products yet!',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
    );
  }
}
