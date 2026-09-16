import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/login_controller.dart';
import '../core/logic/cubit/login/login_cubit.dart';
import '../core/shared/themes/colors.dart';
import '../core/utils/auth_utils.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  LoginController controller = LoginController();
  LoginCubit loginCubit = LoginCubit();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              BlocBuilder(
                bloc: loginCubit,

                builder: (context, state) {
                  bool register = false;

                  if (state is LoginSuccess) {
                    register = state.register;
                  }

                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<LoginCubit>().changeRegister(false);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Entrar',
                              style: TextStyle(
                                color: !register
                                    ? const Color(0xFF33B69A)
                                    : Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 2,
                              width: 36,
                              color: !register
                                  ? const Color(0xFF33B69A)
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 24),

                      GestureDetector(
                        onTap: () {
                          context.read<LoginCubit>().changeRegister(true);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Cadastrar',
                              style: TextStyle(
                                color: register
                                    ? const Color(0xFF33B69A)
                                    : Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 2,
                              width: 52,
                              color: register
                                  ? const Color(0xFF33B69A)
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              if (controller.register)
                TextFieldsCustom(
                  controller: controller.nameController,
                  labelText: "Nome",
                ),
              SizedBox(height: 10),
              TextFieldsCustom(
                controller: controller.emailController,
                labelText: "CPF",
              ),
              SizedBox(height: 10),
              TextFieldsCustom(
                controller: controller.passwordController,
                labelText: "Senha",
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.rememberMe = !controller.rememberMe;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.rememberMe
                                ? const Color(0xFF33B69A)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFF33B69A),
                              width: 1.5,
                            ),
                          ),
                          child: controller.rememberMe
                              ? const Icon(
                                  Icons.check,
                                  size: 11,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Lembrar Sempre',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // ação de esqueci a senha
                    },
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Color(0xFF33B69A),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {
              final email = AuthUtils.cpfToEmail(
                controller.emailController.text,
              );

              if (controller.register) {
                controller.registerUser(
                  email,
                  controller.passwordController.text,
                  controller.nameController.text,
                );
              } else {
                controller.loginUser(
                  email,
                  controller.passwordController.text,
                  context,
                );
              }
            },
            child: Positioned(
              bottom: controller.register ? -50 : -40,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surface,
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF25907A),
                        Color(0xFF63A982),
                        Color(0xFFACB869),
                      ],
                      stops: [0.0, 0.55, 1.0],
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_forward, color: Colors.white),
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

class TextFieldsCustom extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const TextFieldsCustom({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF7A7B89), width: 2),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,

          border: InputBorder.none,
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
