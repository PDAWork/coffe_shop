import 'package:coffee_shop/core/state_managment/cubit/app_bottom_navigation_bar_cubit.dart';
import 'package:coffee_shop/core/talker.dart';
import 'package:coffee_shop/features/auth/presentation/ui/sing_in_screen.dart';
import 'package:coffee_shop/features/auth/presentation/ui/sing_up_screen.dart';
import 'package:coffee_shop/features/auth/presentation/ui/welcome_screen.dart';
import 'package:coffee_shop/features/home/presentation/ui/home_screen.dart';
import 'package:coffee_shop/features/item_coffee/item_coffe_screen.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:coffee_shop/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    // debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    observers: [TalkerRouteObserver(talker)],
    routes: [
      GoRoute(
        path: Pages.welcomeScreen.screenPath,
        name: Pages.welcomeScreen.screenName,
        builder: (context, state) {
          return const WelcomeScreen();
        },
        routes: [
          GoRoute(
            path: Pages.singInScreen.screenPath,
            name: Pages.singInScreen.screenName,
            builder: (context, state) {
              return const SingInScreen();
            },
          ),
          GoRoute(
            path: Pages.signUpScreen.screenPath,
            name: Pages.signUpScreen.screenName,
            builder: (context, state) {
              return const SingUpScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: Pages.homeScreen.screenPath,
        name: Pages.homeScreen.screenName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AppBottomNavigationBarCubit(),
            child: const HomeScreen(),
          );
        },
        routes: [
          GoRoute(
            path: Pages.itemCoffee.screenPath,
            name: Pages.itemCoffee.screenName,
            builder: (context, state) {
              // TODO передавать price
              int price = 100;
              final String nameCoffee = "Latte";
              return BlocProvider(
                create: (context) => ItemCoffeeBloc(price),
                child: ItemCoffeeScreen(
                  nameCoffee: nameCoffee,
                ),
              );
            },
          ),
        ],
      )
    ],
  );
}
