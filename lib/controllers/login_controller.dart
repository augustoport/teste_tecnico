import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_tecnico/views/home_page.dart';

import '../views/login_page.dart';

class LoginController {
  bool register = false;
  bool rememberMe = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> saveRememberMe(text) async {
    final prefs = await SharedPreferences.getInstance();

    if (rememberMe) {
      await prefs.setBool('rememberMe', true);
      await prefs.setString('savedCpf', text);
    } else {
      await prefs.remove('rememberMe');
      await prefs.remove('savedCpf');
    }
  }

  Future<void> registerUser(String cpf, String pass, String name) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: cpf, password: pass);

      await credential.user?.updateDisplayName(name);

      await credential.user?.reload();

      final user = FirebaseAuth.instance.currentUser;

      print('Usuário criado: ${credential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      print('Erro Firebase: ${e.code}');
      print('Mensagem: ${e.message}');
    }
  }

  Future<void> loginUser(String cpf, String pass, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: cpf,
        password: pass,
      );

      if (credential.user != null) {
        if (rememberMe) {
          await saveRememberMe(cpf);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      }

      print('Usuário logado: ${credential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      print('Erro Firebase: ${e.code}');
      print('Mensagem: ${e.message}');
    }
  }

  

  Future<void> logoutUser(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      print('Usuário deslogado com sucesso.');

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    } catch (e) {
      print('Erro ao deslogar: $e');
    }
  }
}
