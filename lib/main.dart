import 'package:flutter/material.dart';
import 'package:soigne_moi_mobile/pages/logoPage.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}