import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soigne_moi_mobile/services/user_service.dart';

import 'loginPage.dart';

class UserInformationPage extends StatelessWidget {
  final Map<String, dynamic> userData;
  final userService = UserService();

  UserInformationPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final medecin = userData['medecin'] ?? {};
    final sessions = userData['sessions'] ?? {};

    void _logout() async {
      try {
        await userService.logoutUser(sessions['token']);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()), // Remplacez par votre page de connexion
              (Route<dynamic> route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Déconnexion Réussie'), duration: Duration(seconds: 3),),
        );
      } catch (e) {
        // Gérez l'erreur ici, par exemple en affichant une snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${medecin['firstName'] ?? ''} ${medecin['name'] ?? ''}'),
        automaticallyImplyLeading: false, // Enlève la flèche de retour
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('Email'),
                subtitle: Text(medecin['email'] ?? 'Non disponible'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Adresse'),
                subtitle: Text('${medecin['address']}, ${medecin['city']} ${medecin['zipCode']}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Spécialité'),
                subtitle: Text(medecin['speciality'] ?? 'Non disponible'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Matricule'),
                subtitle: Text('${medecin['matricule']}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Session actuelle'),
                subtitle: Text('Début: ${sessions['dateHeureDebut']}\nFin: ${sessions['dateHeureFin']}'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Couleur du fond du bouton
                  onPrimary: Colors.white, // Couleur du texte du bouton
                ),
                onPressed: _logout,
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
