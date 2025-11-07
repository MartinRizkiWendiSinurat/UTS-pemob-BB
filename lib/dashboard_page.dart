import 'package:flutter/material.dart';
import 'biodata_page.dart';
import 'kontak_page.dart';
import 'kalkulator_page.dart';
import 'cuaca_page.dart';
import 'berita_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    BiodataScreen(),
    KontakScreen(),
    KalkulatorScreen(),
    CuacaScreen(),
    BeritaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTS Mobile App'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFF9FAFB),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              accountName: const Text(
                'Martin Rizki Wendi Sinurat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text('152023152'),
            ),
            _drawerItem(Icons.person, "Biodata", 0),
            _drawerItem(Icons.contacts, "Kontak", 1),
            _drawerItem(Icons.calculate, "Kalkulator", 2),
            _drawerItem(Icons.cloud, "Cuaca", 3),
            _drawerItem(Icons.article, "Berita", 4),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, int index) {
    final selected = _currentIndex == index;
    return ListTile(
      leading: Icon(icon, color: selected ? const Color(0xFF1E3A8A) : Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? const Color(0xFF1E3A8A) : Colors.black87,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: selected,
      onTap: () {
        setState(() => _currentIndex = index);
        Navigator.pop(context);
      },
    );
  }
}
