import 'package:flutter/material.dart';
import 'loginPage.dart';


class LogoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loadLogoImage(),
            const SizedBox(height: 20), // Espacement
          ],
        ),
      ),
    );
  }

  Widget loadLogoImage() {
    try {
      return Image.asset(
        'assets/img/log_remove_bg.png',
        width: 350, // Ajustez la largeur selon vos besoins
        height: 350, // Ajustez la hauteur selon vos besoins
      );
    } catch (e) {
      // En cas d'erreur lors du chargement de l'image, affichez un Text à la place
      print('Erreur de chargement de l\'image : $e');
      return const Text(
        'Erreur de chargement du logo',
        style: TextStyle(color: Colors.red),
      );
    }
  }

}