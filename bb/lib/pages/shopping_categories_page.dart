import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Reklam alanı için

import 'categories_page.dart'; // CategoriesPage
import 'profile_page.dart'; // ProfilePage
import 'sepetpage.dart'; // CartPage
import 'electronics_page.dart'; // ElectronicsPage
import 'fashion_page.dart'; // FashionPage
import 'home_kitchen_page.dart'; // HomeKitchenPage
import 'sports_page.dart'; // SportsPage
import 'books_page.dart'; // BooksPage
import 'toys_games_page.dart'; // ToysGamesPage

class ShoppingCategoriesPage extends StatelessWidget {
  const ShoppingCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2833),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2A3A47), Color(0xFF1E2833)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: 100,
              alignment: Alignment.bottomCenter,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Discover Amazing Deals!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'eskiyol',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.yellow),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Reklam alanı
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CarouselSlider(
                items: [
                  _buildAdCard('assets/ad1.jpg', 'Big Sale: Electronics!'),
                  _buildAdCard('assets/ad2.jpg', 'Fashion Week Discounts!'),
                  _buildAdCard('assets/ad3.jpg', 'Home & Kitchen Deals!'),
                ],
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.85,
                ),
              ),
            ),
            // Kayan yazılar
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildAnimatedText('🔥 Shop now and save more!', Colors.blue),
                  _buildAnimatedText('⚡ Fast delivery available!', Colors.pink),
                  _buildAnimatedText('🌟 New arrivals every week!', Colors.orange),
                ],
              ),
            ),
            // Kategoriler
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCategoryCard(context, Icons.devices, 'Electronics',
                      Colors.blue, const ElectronicsPage()),
                  _buildCategoryCard(context, Icons.shopping_bag, 'Fashion',
                      Colors.pink, const FashionPage()),
                  _buildCategoryCard(context, Icons.kitchen, 'Home & Kitchen',
                      Colors.green, const HomeKitchenPage()),
                  _buildCategoryCard(context, Icons.sports_basketball, 'Sports',
                      Colors.orange, const SportsPage()),
                  _buildCategoryCard(context, Icons.book, 'Books', Colors.red,
                      const BooksPage()),
                  _buildCategoryCard(context, Icons.toys, 'Toys & Games',
                      Colors.purple, const ToysGamesPage()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2A3A47),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: 0, // Şu anda "Home" sayfasındayız
        onTap: (index) {
          if (index == 0) {
            // Şu anda bu sayfadayız
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoriesPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildAdCard(String imagePath, String label) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedText(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Icon(Icons.arrow_right, color: Colors.white),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: color.withOpacity(0.5),
                  offset: const Offset(1, 1),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, IconData icon, String title,
      Color color, Widget targetPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), const Color(0xFF2A3A47)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Explore now',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
