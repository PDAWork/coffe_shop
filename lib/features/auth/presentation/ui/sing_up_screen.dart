import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:coffee_shop/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:coffee_shop/features/auth/presentation/widget/text_field_auth.dart';
import 'package:coffee_shop/router/app_router.dart';
import 'package:coffee_shop/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            homeMarketCoffee,
            const SizedBox(height: 25),
            Text(
              'Регистрация',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextFieldAuth(
                    controller: _nameController,
                    hintText: 'Имя',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 25),
                  TextFieldAuth(
                    controller: _emailController,
                    hintText: 'Почта',
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  TextFieldAuth(
                    controller: _passwordController,
                    hintText: 'Пароль',
                    icon: Icons.key,
                    obscureText: true,
                    suffixIcon: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                padding: const EdgeInsets.only(
                                  bottom: 0,
                                  left: 15,
                                  right: 15,
                                  top: 15,
                                ),
                                backgroundColor: primary,
                                content: Text(state.message),
                              ),
                            );
                          }
                          if (state is AuthSuccess) {
                            AppRouter.router.go(Pages.homeScreen.screenPath);
                          }
                        },
                        builder: (context, state) {
                          return switch (state) {
                            AuthInitial _ ||
                            AuthSuccess _ ||
                            AuthError _ =>
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await context.read<AuthCubit>().singUp(
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        );
                                  },
                                  child: const Text("Зарегистрироваться"),
                                ),
                              ),
                            AuthLoading _ => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          };
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
