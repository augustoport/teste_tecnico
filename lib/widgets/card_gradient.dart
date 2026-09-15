import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardGradient extends StatelessWidget {
  final bool isLogin;
  final String? name;
  const CardGradient(this.name, {super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLogin
          ? MediaQuery.of(context).size.height * 0.45
          : MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF34A58C), Color(0xFF5EB58B), Color(0xFFD5D987)],
        ),
        borderRadius: isLogin ? BorderRadius.circular(10): null,
      ),
      child: isLogin
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/logo_tokyo.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              Text(
                "Bem vindo!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Aqui você gerencia seus seguros e de seus familiares\nem poucos cliques!",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.account_circle, color: Colors.white, size: 50),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bem Vindo",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        name!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
