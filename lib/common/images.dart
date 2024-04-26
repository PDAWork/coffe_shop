import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final homeMarketCoffee = Image.asset('images/home_market_coffe.png');
final coffeeTime = Image.asset('images/coffee_time.png');
final americano = SvgPicture.asset('images/americano.svg');
final corretto = SvgPicture.asset('images/corretto.svg');
final espressoRomano = SvgPicture.asset('images/espresso_romano.svg');
final espresso = SvgPicture.asset('images/espresso.svg');
final galao = SvgPicture.asset('images/galao.svg');
final latte = SvgPicture.asset('images/latte.svg', fit: BoxFit.contain);
final lungo = SvgPicture.asset('images/lungo.svg');
final macchiato = SvgPicture.asset('images/macchiato.svg');
final coffeCupUnSelect = SvgPicture.asset('images/coffee_cup_un_select.svg');
final coffeCupSelect = SvgPicture.asset('images/coffee_cup_select.svg');
final profile = SvgPicture.asset('images/profile.svg');
final order = SvgPicture.asset('images/order.svg');
final edit = SvgPicture.asset('images/edit.svg');

Widget small({Color color = Colors.white}) => SvgPicture.asset(
      'images/small.svg',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
Widget medium({Color color = Colors.white}) => SvgPicture.asset(
      'images/medium.svg',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
Widget large({Color color = Colors.white}) => SvgPicture.asset(
      'images/large.svg',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );

Widget notSugar({Color color = Colors.white}) => SvgPicture.asset(
      'images/not_sugar.svg',
      width: 35,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
Widget oneSugar({Color color = Colors.white}) => SvgPicture.asset(
      'images/one_sugar.svg',
      width: 30,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
Widget twoSugar({Color color = Colors.white}) => SvgPicture.asset(
      'images/two_sugar.svg',
      width: 40,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
Widget threeSugar({Color color = Colors.white}) => SvgPicture.asset(
      'images/three_sugar.svg',
      width: 40,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
