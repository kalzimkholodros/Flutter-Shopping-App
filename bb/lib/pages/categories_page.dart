import 'package:flutter/material.dart';
import 'shopping_categories_page.dart'; // Home (ShoppingCategoriesPage) sayfasını içe aktarıyoruz
import 'profile_page.dart'; // Profile sayfasını içe aktarıyoruz
import 'electronics_page.dart'; // ElectronicsPage
import 'fashion_page.dart'; // FashionPage
import 'home_kitchen_page.dart'; // HomeKitchenPage
import 'sports_page.dart'; // SportsPage
import 'books_page.dart'; // BooksPage
import 'toys_games_page.dart'; // ToysGamesPage

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2833),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A3A47),
        title: const Text('Categories'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ShoppingCategoriesPage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  _buildCategoryCard(
                      context, Icons.devices, 'Electronics', Colors.blue, const ElectronicsPage()),
                  _buildCategoryCard(
                      context, Icons.shopping_bag, 'Fashion', Colors.pink, const FashionPage()),
                  _buildCategoryCard(context, Icons.kitchen, 'Home & Kitchen',
                      Colors.green, const HomeKitchenPage()),
                  _buildCategoryCard(context, Icons.sports_basketball, 'Sports',
                      Colors.orange, const SportsPage()),
                  _buildCategoryCard(
                      context, Icons.book, 'Books', Colors.red, const BooksPage()),
                  _buildCategoryCard(context, Icons.toys, 'Toys & Games',
                      Colors.purple, const ToysGamesPage()),
                ],
              ),
            ),
            // Önerilenler Başlığı
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                'Recommended for You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Önerilenler Listesi
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildRecommendedCard('Smartphone', '\$299', 'assets/electronics.jpg'),
                  _buildRecommendedCard('Sneakers', '\$99', 'assets/fashion.jpg'),
                  _buildRecommendedCard('Blender', '\$49', 'assets/home_kitchen.jpg'),
                  _buildRecommendedCard('Basketball', '\$29', 'assets/sports.jpg'),
                  _buildRecommendedCard('Novel', '\$19', 'assets/books.jpg'),
                ],
              ),
            ),
            // Hoşunuza Gidebilir Başlığı
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                'You May Also Like',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Hoşunuza Gidebilir Listesi
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildRecommendedCard('Laptop', '\$599', 'assets/electronics.jpg'),
                  _buildRecommendedCard('Dress', '\$79', 'assets/fashion.jpg'),
                  _buildRecommendedCard('Cookware Set', '\$89', 'assets/home_kitchen.jpg'),
                  _buildRecommendedCard('Football', '\$25', 'assets/sports.jpg'),
                  _buildRecommendedCard('Puzzle', '\$15', 'assets/toys_games.jpg'),
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
        currentIndex: 1, // Şu anda "Categories" sayfasındayız
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ShoppingCategoriesPage(),
              ),
            );
          } else if (index == 1) {
            // Şu anda bu sayfadayız, bir işlem yapmıyoruz
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

  Widget _buildCategoryCard(BuildContext context, IconData icon, String title, Color color,
      Widget targetPage) {
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
              color: Colors.black.withOpacity(0.3),
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

  Widget _buildRecommendedCard(String title, String price, String imagePath) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
