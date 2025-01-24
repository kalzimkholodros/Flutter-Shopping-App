import 'package:flutter/material.dart';
import 'login.dart'; // LoginPage'i içe aktarıyoruz
import 'edit.dart'; // EditProfilePage'i içe aktarıyoruz
import 'change.dart'; // ChangePasswordPage'i içe aktarıyoruz
import 'noti.dart'; // NotificationSettingsPage'i içe aktarıyoruz
import 'privacy.dart'; // PrivacyPolicyPage'i içe aktarıyoruz

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A3A47),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFF1E2833),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSettingsOption(
              context,
              title: 'Edit Profile',
              icon: Icons.person_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
            ),
            _buildSettingsOption(
              context,
              title: 'Change Password',
              icon: Icons.lock_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage(),
                  ),
                );
              },
            ),
            _buildSettingsOption(
              context,
              title: 'Notification Settings',
              icon: Icons.notifications_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationSettingsPage(),
                  ),
                );
              },
            ),
            _buildSettingsOption(
              context,
              title: 'Privacy Policy',
              icon: Icons.privacy_tip_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
              },
            ),
            _buildSettingsOption(
              context,
              title: 'Log Out',
              icon: Icons.logout,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              iconColor: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap,
      Color iconColor = Colors.blueAccent}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF2A3A47),
          borderRadius: BorderRadius.circular(15),
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
            Icon(icon, color: iconColor, size: 30),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 20),
          ],
        ),
      ),
    );
  }
}
