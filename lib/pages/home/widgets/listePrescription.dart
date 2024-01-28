import 'package:flutter/material.dart';
import 'package:soigne_moi_mobile/pages/PrescriptionDetailPage.dart';
import 'package:soigne_moi_mobile/services/prescription_service.dart';

class ListePrescription extends StatefulWidget {
  final int medecinId;
  final double taillebottomBar;

  const ListePrescription({super.key, required this.medecinId, required this.taillebottomBar});

  @override
  _ListePrescriptionState createState() => _ListePrescriptionState();
}

class _ListePrescriptionState extends State<ListePrescription> {
  final PrescriptionService prescriptionService = PrescriptionService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: prescriptionService.getAllPrescriptionByMedecin(widget.medecinId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!['Prescriptions'].isEmpty) {
          return const Center(child: Text('Aucune prescription trouvée pour ce medecin'));
        }

        List<dynamic> prescriptions = snapshot.data!['Prescriptions'];

        return Container(
          height: MediaQuery.of(context).size.height - (widget.taillebottomBar.toInt() * 4.20),
          color: Colors.grey[200], // Couleur d'arrière-plan légère
          child: ListView.separated(
            itemCount: prescriptions.length,
            itemBuilder: (context, index) {
              var prescription = prescriptions[index];
              return Card( // Utiliser Card pour un meilleur effet visuel
                margin: const EdgeInsets.all(8.0), // Marges autour de chaque carte
                child: ListTile(
                  leading: const Icon(Icons.medical_services, color: Colors.lightGreen), // Icône en début de ListTile
                  title: Text(
                    prescription['listeMedicamentAndPodologie'] ?? 'Médicaments non spécifiés',
                    style: const TextStyle(fontWeight: FontWeight.bold), // Style de texte
                  ),
                  subtitle: Text(
                    'N* Prescription: ${prescription['prescription_id'].toString()}',
                    style: TextStyle(color: Colors.green[600]), // Couleur de sous-titre
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrescriptionDetailPage(
                          id: prescription['prescription_id'].toString(),
                          user_id: prescription['user_id'],
                          dateDebut: prescription['dateDebutTraitement'],
                          dateFin: prescription['dateFinTraitement'],
                          list: prescription['listeMedicamentAndPodologie'],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 1), // Séparateur visible
          ),
        );
      },
    );
  }
}
