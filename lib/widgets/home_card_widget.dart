import 'package:flutter/material.dart';

import '../core/shared/themes/colors.dart';

class HomeCardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const HomeCardWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(icon, color: Colors.white, size: 50),
          SizedBox(height:30),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center),
      
      ]),
    );
  }
}
