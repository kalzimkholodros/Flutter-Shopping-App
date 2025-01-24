import 'package:flutter/material.dart';
import 'shopping_categories_page.dart'; // Genel alışveriş sayfasını içe aktarıyoruz
import 'categories_page.dart'; // Categories sayfasını içe aktarıyoruz
import 'like.dart'; // Beğenilen ürünler sayfası
import 'dislike.dart'; // Beğenilmeyen ürünler sayfası
import 'history.dart'; // Sipariş geçmişi sayfası
import 'setting.dart'; // Ayarlar sayfası

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2833),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A3A47),
        title: const Text('Profile'),
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
          children: [
            // Kullanıcı Bilgisi
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2A3A47), Color(0xFF1E2833)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage('assets/profile_picture.jpg'),
                    backgroundColor: Colors.grey.shade800,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Loyal Customer',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Sipariş Geçmişi ve Beğeni Bölümleri
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildOptionCard(
                    context,
                    'Order History',
                    'View your past orders',
                    Icons.shopping_bag_outlined,
                    Colors.blueAccent,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HistoryPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildOptionCard(
                    context,
                    'Liked Products',
                    'View products you liked',
                    Icons.thumb_up_outlined,
                    Colors.greenAccent,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LikePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildOptionCard(
                    context,
                    'Disliked Products',
                    'View products you disliked',
                    Icons.thumb_down_outlined,
                    Colors.redAccent,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DislikePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Ayarlar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildOptionCard(
                context,
                'Settings',
                'Manage your preferences',
                Icons.settings_outlined,
                Colors.grey,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2A3A47),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        currentIndex: 2, // Şu anda "Profile" sayfasındayız
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ShoppingCategoriesPage(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoriesPage(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(
      BuildContext context, String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), const Color(0xFF2A3A47)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white60, size: 18),
          ],
        ),
      ),
    );
  }
}
