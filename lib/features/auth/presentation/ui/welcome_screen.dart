import 'package:coffee_shop/common/images.dart';
import 'package:coffee_shop/router/app_router.dart';
import 'package:coffee_shop/router/router_utils.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          coffeeTime,
          const SizedBox(height: 33),
          Text(
            'Получить лучшее кофе\nВ городе!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  AppRouter.router.goNamed(Pages.signUpScreen.screenName);
                },
                child: const Text("Регистрация"),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  AppRouter.router.goNamed(Pages.singInScreen.screenName);
                },
                child: const Text("Авторизация"),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
