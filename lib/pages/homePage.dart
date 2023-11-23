import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      label: 'Accueil',
      icon: Icon(Icons.home),
    ),
    const BottomNavigationBarItem(
      label: 'Explorer',
      icon: Icon(Icons.explore),
    ),
    const BottomNavigationBarItem(
      label: 'Profil',
      icon: Icon(Icons.person),
    ),
    const BottomNavigationBarItem(
      label: 'Paramètres',
      icon: Icon(Icons.settings),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: const Center(
        child: Text(
          'Bienvenue sur la page d\'accueil !',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNavBarItems,
      ),
    );
  }
}
