import 'package:flutter/material.dart';

class PrescriptionDetailPage extends StatelessWidget {
  final String name;

  const PrescriptionDetailPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Row (
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10), // Ajoutez un padding pour éviter que le texte touche les bords
                  child: Text(
                    'Description : ',
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left, // Aligner le texte à droite
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10), // Ajoutez un padding pour éviter que le texte touche les bords
                  child: Text(
                    'L\'API $name est utilisée pour\nconsulté les données de météo mis à disposition\ngratuitement',
                    style: const TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
                    textAlign: TextAlign.left, // Aligner le texte à droite
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
