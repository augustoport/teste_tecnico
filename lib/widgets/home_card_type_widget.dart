import 'package:flutter/material.dart';

import '../core/themes/colors.dart';


class CardType extends StatelessWidget {
  final String title;
  final IconData icon;
  const CardType({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 90,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}