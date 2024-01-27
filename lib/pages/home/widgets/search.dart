import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {

  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.yellow,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      child: Stack(
        children: [
          TextField(),
          Positioned(child: Container(
            height: 50,
            width: 50,
            color: Colors.red,
          ))
        ],
      ),
    );
  }

}