import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:coffee_shop/core/widget/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Поиск',
                            hintStyle: const TextStyle(color: primary),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 0,
                            ),
                            filled: true,
                            fillColor: filedFieldSearch,
                            constraints: const BoxConstraints(maxHeight: 54),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 54,
                        child: FloatingActionButton(
                          onPressed: () {},
                          elevation: 0,
                          backgroundColor: primary,
                          child: const Icon(
                            Icons.search,
                            color: filedFieldSearch,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 26,
                        crossAxisSpacing: 26,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: filedFieldSearch,
                            border: Border.all(color: primary),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(10),
                          height: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              galao,
                              Text(
                                'Latte',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                '200 ₽',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: primary),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: AppBottomNavigationBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
