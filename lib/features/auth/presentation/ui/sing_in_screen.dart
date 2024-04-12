import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:flutter/material.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

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
              'Авторизация',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 76),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: primary,
                      ),
                      filled: true,
                      fillColor: filedTextField,
                      contentPadding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(maxHeight: 46),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        Icons.key,
                        color: primary,
                      ),
                      filled: true,
                      fillColor: filedTextField,
                      contentPadding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(maxHeight: 46),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Войти"),
                          ),
                        ),
                      ),
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
