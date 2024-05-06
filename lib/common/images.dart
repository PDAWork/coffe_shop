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

abstract class AppImagePath {
  static const String small = 'images/small.svg';
  static const String medium = 'images/medium.svg';
  static const String large = 'images/large.svg';

  static const notSugar = 'images/not_sugar.svg';
  static const oneSugar = 'images/one_sugar.svg';
  static const twoSugar = 'images/two_sugar.svg';
  static const threeSugar = 'images/three_sugar.svg';
}
