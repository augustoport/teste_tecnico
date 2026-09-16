import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_tecnico/controllers/login_controller.dart';
import 'package:teste_tecnico/widgets/login_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/shared/themes/colors.dart';
import '../widgets/card_gradient.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = LoginController();

  @override
  void initState() {
    super.initState();

    print(FirebaseAuth.instance.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              CardGradient(isLogin: true, null),
              Spacer(),
              SocialCard(),
            ],
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: 350,
              child: LoginCard(),
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
            SvgPicture.asset(
              height: 30,
              width: 30,
              'assets/svg/logo-google.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            SizedBox(width: 10),
            SvgPicture.asset(
              height: 30,
              width: 30,
              'assets/svg/twitter-black-shape.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            SizedBox(width: 10),

            SvgPicture.asset(
              height: 30,
              width: 30,
              'assets/svg/facebook-fill.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
      ],
    );
  }
}
