import 'package:flutter/material.dart';

import '../core/themes/colors.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
      ),
      child: Column(
        children: [
          Text("Bem vindo!", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
          Text("Aqui você gerencia seus seguros e de seus familiares\nem poucos cliques!", style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}