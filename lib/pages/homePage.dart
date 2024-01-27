import 'package:flutter/material.dart';
import 'package:soigne_moi_mobile/pages/home/widgets/header.dart';
import 'package:soigne_moi_mobile/pages/home/widgets/listePrescription.dart';

class HomePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  HomePage({required this.userData});

  @override
  Widget build(BuildContext context) {
    String userType = userData.containsKey('medecin')
        ? 'Medecin'
        : userData.containsKey('administrateur')
        ? 'Administrateur'
        : 'Utilisateur Normal';

    Map<String, dynamic> user = userData.containsKey('medecin')
        ? userData['medecin']
        : userData.containsKey('administrateur')
        ? userData['administrateur']
        : userData['utilisateur'];

    final String nom = user['name'] ?? 'Nom inconnu';
    final String firstName = user['firstName'] ?? 'Prénom inconnu';
    final String matricule = user['matricule'].toString();


    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                HeaderSection(
                  name: nom, matricule: matricule, firstName: firstName,
                ),
                const ListePrescription(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
  Widget NavigationBar() {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.orangeAccent,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home, size: 30,),
              ),
              BottomNavigationBarItem(
                  label: 'Prescription',
                  icon: Icon(Icons.book_online, size: 30,)
              ),
              BottomNavigationBarItem(
                  label: 'Account',
                  icon: Icon(Icons.account_circle, size: 30,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
