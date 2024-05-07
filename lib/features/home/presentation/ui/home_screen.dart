import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/core/state_managment/bloc/basket_coffee_bloc.dart';
import 'package:coffee_shop/core/state_managment/cubit/app_bottom_navigation_bar_cubit.dart';
import 'package:coffee_shop/core/widget/app_bottom_navigation_bar.dart';
import 'package:coffee_shop/features/home/presentation/pages/basket_page.dart';
import 'package:coffee_shop/features/home/presentation/pages/home_page.dart';
import 'package:coffee_shop/features/home/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectTab =
        context.watch<AppBottomNavigationBarCubit>().state.homePages;

    return Scaffold(
      appBar: (selectTab.index == 2 || selectTab.index == 3)
          ? AppBar(
              title: Text(
                selectTab.title,
              ),
            )
          : PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                color: primary,
              ),
            ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Stack(
            children: [
              BlocBuilder<BasketCoffeeBloc, BasketCoffeeState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: kBottomNavigationBarHeight +
                            (state.basketItem.isNotEmpty
                                ? kBottomNavigationBarHeight
                                : 0)),
                    child: IndexedStack(
                      index: selectTab.index,
                      children: const [
                        HomePage(),
                        BasketPage(),
                        ProfilePage(),
                      ],
                    ),
                  );
                },
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
