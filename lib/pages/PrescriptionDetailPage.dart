import 'package:flutter/material.dart';
import 'package:soigne_moi_mobile/services/user_service.dart'; // Assurez-vous d'importer votre service utilisateur

class PrescriptionDetailPage extends StatefulWidget {
  final String id;
  final int user_id;
  final String list;
  final String dateDebut;
  final String dateFin;

  const PrescriptionDetailPage({super.key, required this.id, required this.user_id, required this.dateDebut, required this.dateFin, required this.list});

  @override
  _PrescriptionDetailPageState createState() => _PrescriptionDetailPageState();
}

class _PrescriptionDetailPageState extends State<PrescriptionDetailPage> {
  final UserService userService = UserService(); // Remplacez par votre instance de service

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription N°${widget.id}'),
        backgroundColor: Colors.green, // Couleur de l'AppBar
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: userService.getUserById(widget.user_id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Aucune information disponible pour l\'utilisateur'));
          }

          var user = snapshot.data!['user'];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _buildCard('Patient', '${user['name']} ${user['firstName']}', Icons.person),
                _buildCard('Email', user['email'], Icons.email),
                _buildCard('Liste des médicaments', widget.list, Icons.medication),
                _buildCard('Début du traitement', widget.dateDebut, Icons.calendar_today),
                _buildCard('Fin du traitement', widget.dateFin, Icons.calendar_today),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard(String title, String content, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
      ),
    );
  }
}
