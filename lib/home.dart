import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeChange;
  const HomeScreen({super.key, required this.onThemeChange});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Confirm Logout', style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dctx); // اغلاق الـ dialog
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                Navigator.pop(dctx); // اغلاق الـ dialog
                // اذهب للـ login وامسح الستاك
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkNow = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    Text('Welcome!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pink)),
                    SizedBox(height: 6),
                    Text('This is your Home screen', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // زرار سويتش للثيم
              SwitchListTile(
                title: const Text('Dark Theme'),
                value: isDarkNow,
                onChanged: (v) => onThemeChange(v),
                secondary: Icon(isDarkNow ? Icons.nights_stay : Icons.wb_sunny, color: Colors.pink),
              ),

              const SizedBox(height: 18),

              // زرار اللوغ آوت
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showLogoutDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Logout', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
