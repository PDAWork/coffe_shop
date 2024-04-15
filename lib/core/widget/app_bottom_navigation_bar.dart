import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/core/state_managment/cubit/app_bottom_navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBottomNavigationBarCubit,
        AppBottomNavigationBarState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BottomNavigationBar(
            backgroundColor: filedFieldSearch,
            elevation: 0,
            currentIndex: state.homePages.index,
            unselectedItemColor: unSelectIcon,
            selectedItemColor: selectIcon,
            selectedLabelStyle: const TextStyle(color: selectIcon),
            unselectedLabelStyle: const TextStyle(color: unSelectIcon),
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              context.read<AppBottomNavigationBarCubit>().setTab(
                    HomePages.values[value],
                  );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on_outlined,
                ),
                label: 'Карта',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: 'Корзина',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'Профиль',
              )
            ],
          ),
        );
      },
    );
  }
}
