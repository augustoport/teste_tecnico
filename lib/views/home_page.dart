import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_tecnico/core/logic/cubit/home/home_cubit.dart';
import 'package:teste_tecnico/views/auto_webview.dart';
import 'package:teste_tecnico/widgets/card_gradient.dart';
import 'package:teste_tecnico/widgets/drawer_bottom_card.dart';

import '../controllers/login_controller.dart';
import '../core/shared/themes/colors.dart';
import '../widgets/home_card_type_widget.dart';
import '../widgets/home_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit homeCubit = HomeCubit();
  LoginController loginController = LoginController();

  @override
  initState() {
    super.initState();
    homeCubit.loadHomeData();
  }

  @override
  dispose() {
    homeCubit.close();
    super.dispose();
  }

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
        backgroundColor: AppColors.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.background),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá!',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle, color: Colors.white, size: 50),
                      Text(
                        ' ${homeCubit.state is HomeSuccess ? (homeCubit.state as HomeSuccess).user ?? '' : ''}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
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
              leading: Icon(Icons.close,   color: Colors.white),
              title: Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                loginController.logoutUser(context);
              },
            ),
           
            BottomCard(),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocBuilder(
              bloc: homeCubit,
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
                if (state is HomeSuccess) {
                  
                  return Column(
                    children: [
                      CardGradient(isLogin: false, state.user),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cotar e Contratar",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: .center,
                              children: List.generate(4, (i) {
                                return CardType(
                                  title: [
                                    "Automóvel",
                                    "Residência",
                                    "Vida",
                                    "Acidentes Pessoais",
                                  ][i],
                                  icon: [
                                    Icons.car_repair,
                                    Icons.home,
                                    Icons.local_hospital,
                                    Icons.accessibility,
                                  ][i],
                                  onTap: [
                                    () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const AutomobileWebViewPage(),
                                        ),
                                      );
                                    },
                                    null,
                                    null,
                                    null,
                                  ][i],
                                );
                              }),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Minha Familia",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            HomeCardWidget(
                              icon: Icons.add_circle_outline,
                              text:
                                  "Adicione aqui membros da sua família e\ncompartilhe os seguros com eles.",
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Contratados",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            HomeCardWidget(
                              icon: Icons.not_accessible,
                              text: "Você ainda não possui seguros contratados.",
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is HomeError) {
                  return Center(child: Text("Erro ao carregar dados"));
                } else {
                  return Center(child: Text("Nenhum dado disponível"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
