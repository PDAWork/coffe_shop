import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_bottom_navigation_bar_state.dart';

class AppBottomNavigationBarCubit extends Cubit<AppBottomNavigationBarState> {
  AppBottomNavigationBarCubit() : super(const AppBottomNavigationBarState());

  void setTab(HomePages tab) => emit(state.copyWith(homePages: tab));
}
