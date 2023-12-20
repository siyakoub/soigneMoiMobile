import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue ${user['firstName']} ${user['name']} !',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Type d\'utilisateur: $userType',
              style: TextStyle(fontSize: 16),
            ),
            // D'autres informations spécifiques à l'utilisateur peuvent être affichées ici
          ],
        ),
      ),
    );
  }
}
