import 'package:flutter/material.dart';

import '../core/shared/themes/colors.dart';


class CardType extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const CardType({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: 
      onTap == null ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        ],
      ) : InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(height: 4),
            Text(title, style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}