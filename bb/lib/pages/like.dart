import 'package:flutter/material.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> likedProducts = [
      'Product 1',
      'Product 3',
      'Product 5',
    ]; // Beğenilen ürünlerin örnek listesi

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A3A47),
        title: const Text(
          'Liked Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF1E2833),
      body: likedProducts.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: likedProducts.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF2A3A47),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.thumb_up,
                      color: Colors.green,
                      size: 40,
                    ),
                    title: Text(
                      likedProducts[index],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: const Text(
                      'This product was liked!',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'No liked products yet!',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
    );
  }
}
