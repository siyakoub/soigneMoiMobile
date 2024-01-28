import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String name;
  final String firstName;
  final String matricule;

  const HeaderSection({super.key, required this.name, required this.matricule, required this.firstName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
        bottom: 20, // Ajout d'un padding en bas pour un meilleur espacement
      ),
      decoration: BoxDecoration(
        color: Colors.green, // Couleur de fond de la section d'en-tête
        borderRadius: BorderRadius.circular(20), // Rayon pour arrondir les coins
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenue $name $firstName,\nMatricule : $matricule',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
