part of 'app_bottom_navigation_bar_cubit.dart';

enum HomePages {
  home(
    title: 'Главная',
  ),
  location(
    title: 'Карта',
  ),
  basket(
    title: 'Корзина',
  ),
  profile(
    title: 'Профиль',
  );

  const HomePages({
    required this.title,
  });
  final String title;
}

@immutable
final class AppBottomNavigationBarState {
  final HomePages homePages;

  const AppBottomNavigationBarState({ this.homePages = HomePages.home});

  AppBottomNavigationBarState copyWith({
    HomePages? homePages,
  }) {
    return AppBottomNavigationBarState(
      homePages: homePages ?? this.homePages,
    );
  }
}
