import 'package:flutter/material.dart';
import 'package:teste_tecnico/controllers/login_controller.dart';
import 'package:teste_tecnico/views/home_page.dart';

import '../core/themes/colors.dart';
import '../widgets/card_gradient.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(children: [CardGradient(isLogin: true), Spacer(), SocialCard()]),
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 24, color: AppColors.primaryDark, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/logo_flower.png', height: 50, width: 150),
        SizedBox(height: 20),
        Text(
          "Acesse nossas redes sociais",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.g_mobiledata, color: Colors.white, size: 50),
            Icon(Icons.one_x_mobiledata, color: Colors.white, size: 50),
            Icon(Icons.face, color: Colors.white, size: 50),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
      ],
    );
  }
}
