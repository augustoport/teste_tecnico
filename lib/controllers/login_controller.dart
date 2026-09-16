import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_tecnico/core/logic/cubit/login/login_cubit.dart';
import 'package:teste_tecnico/views/home_page.dart';

import '../views/login_page.dart';

class LoginController {
  LoginCubit loginCubit = LoginCubit();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> saveRememberMe(text) async {
    final prefs = await SharedPreferences.getInstance();

    if (loginCubit.rememberMe) {
      await prefs.setBool('rememberMe', true);
      await prefs.setString('savedCpf', text);
    } else {
      await prefs.remove('rememberMe');
      await prefs.remove('savedCpf');
    }
  }

  Future<void> registerUser(String cpf, String pass, String name) async {
    try {
      loginCubit.setLoading();
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: cpf, password: pass);

      await credential.user?.updateDisplayName(name);

      await credential.user?.reload();

    } finally {
      loginCubit.initPage();
    }
  }

  Future<void> loginUser(String cpf, String pass, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: cpf,
        password: pass,
      );

      if (credential.user != null) {
        if (loginCubit.rememberMe) {
          await saveRememberMe(cpf);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      }

    } on FirebaseAuthException catch (e) {
      loginCubit.initPage();
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
