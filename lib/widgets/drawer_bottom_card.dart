import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          colors: [Color(0xFF34A58C), Color(0xFF5EB58B), Color(0xFFD5D987)],
        ),
      ),
      child: const Center(
        child: Column(
          children: [
            Icon(Icons.email, color: Colors.white, size: 50,),
            Text(
              'Duvidas?\nConte sempre com a gente.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
