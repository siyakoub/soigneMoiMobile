import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'homePage.dart';


class LogoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Future.delayed(Duration(seconds: 3), () {
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
            // Insérez votre logo ici (remplacez AssetImage par votre image)
            loadLogoImage(),
            SizedBox(height: 20), // Espacement
          ],
        ),
      ),
    );
  }

  Widget loadLogoImage() {
    try {
      return Image.asset(
        'assets/img/logo.png',
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