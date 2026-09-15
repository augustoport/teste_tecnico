import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardGradient extends StatelessWidget {
  final bool isLogin;
  const CardGradient({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLogin ? MediaQuery.of(context).size.height * 0.45 : MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF34A58C), Color(0xFF5EB58B), Color(0xFFD5D987)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isLogin ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SvgPicture.asset('assets/svg/logo_tokyo.svg', height: 25, width: 25),
            Text("Bem vindo!", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
            Text("Aqui você gerencia seus seguros e de seus familiares\nem poucos cliques!", style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ) : Row(),
    );
  }
}
