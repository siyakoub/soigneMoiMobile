import 'package:flutter/material.dart';
import 'package:soigne_moi_mobile/pages/PrescriptionDetailPage.dart';

class ListePrescription extends StatelessWidget {
  const ListePrescription({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste des noms à afficher
    final List<String> noms = ['OpenWeatherMap API', 'Mapbox API', 'ExchangeRate-API', 'NewsAPI', 'Google Cloud Translation API', 'COVID-19 Data API'];

    return Container(
      height: 700,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: noms.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Naviguer vers une nouvelle page avec les données de l'élément cliqué
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrescriptionDetailPage(name: noms[index]),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.lightBlueAccent, // Couleur de la ligne
                    width: 1.0, // Épaisseur de la ligne
                  ),
                  top: BorderSide(
                    color: Colors.lightBlueAccent, // Couleur de la ligne
                    width: 1.0, // Épaisseur de la ligne
                  ),
                ),
              ),
              child: Text(
                noms[index],
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}