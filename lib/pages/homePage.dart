import 'package:flutter/material.dart';
import 'package:soigne_moi_mobile/pages/home/widgets/header.dart';
import 'package:soigne_moi_mobile/pages/home/widgets/listePrescription.dart';
import 'package:soigne_moi_mobile/pages/UserInformationPage.dart';
import 'package:soigne_moi_mobile/pages/newPrescriptionFormPage.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  HomePage({required this.userData});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  double appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    final user = _getUserData();

    List<Widget> _screens = [
      _buildHomePageScreen(user),
      UserInformationPage(userData: widget.userData),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(user),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Map<String, dynamic> _getUserData() {
    return widget.userData.containsKey('medecin')
        ? widget.userData['medecin']
        : widget.userData.containsKey('administrateur')
        ? widget.userData['administrateur']
        : widget.userData['utilisateur'];
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.orangeAccent,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      unselectedItemColor: Colors.grey.withOpacity(0.7),
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home, size: 30,),
        ),
        BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.account_circle, size: 30,)
        ),
      ],
    );
  }

  FloatingActionButton? _buildFloatingActionButton(Map<String, dynamic> user) {
    if (_selectedIndex == 0 && user.containsKey('email')) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPrescriptionFormPage(medecinEmail: user['email'])),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      );
    }
    return null;
  }

  Widget _buildHomePageScreen(Map<String, dynamic> user) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderSection(
            name: user['name'] ?? 'Nom inconnu',
            firstName: user['firstName'] ?? 'Prénom inconnu',
            matricule: user['matricule'].toString(),
          ),
          // Utilisation de la hauteur de la barre d'app
          ListePrescription(medecinId: user['medecin_id'], taillebottomBar: appBarHeight),
        ],
      ),
    );
  }
}
