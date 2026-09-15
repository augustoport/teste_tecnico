import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_tecnico/widgets/card_gradient.dart';

import '../core/themes/colors.dart';
import '../widgets/home_card_type_widget.dart';
import '../widgets/home_card_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  'assets/svg/logo_tokyo.svg',
                  height: 25,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            Icon(Icons.notification_add),
          ],
        ),

        backgroundColor: AppColors.background,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle Home navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings navigation
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardGradient(isLogin: false),
          Text(
            "Cotar e Contratar",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: List.generate(4, (i) {
              return CardType(
                title: ["Automóvel", "Residência", "Vida", "Acidentes Pessoais"][i],
                icon: [Icons.car_repair, Icons.home, Icons.local_hospital, Icons.accessibility][i],
              );
            }),
          ),
          Text(
            "Minha Familia",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          HomeCardWidget(icon: Icons.add_circle_outline, text: "Adicione aqui membros da sua família e\ncompartilhe os seguros com eles.",),
          Text(
            "Contratados",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          HomeCardWidget(icon: Icons.not_accessible, text: "Você ainda não possui seguros contratados.",),
        ],
      ),
    );
  }
}

