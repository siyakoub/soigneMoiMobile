import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {

  final String name;
  final String firstName;
  final String matricule;

  const HeaderSection({super.key, required this.name, required this.matricule, required this.firstName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
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