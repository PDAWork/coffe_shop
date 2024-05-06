import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SugarCoffeeWidget extends StatelessWidget {
  const SugarCoffeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _ItemSugar(
          pathIcon: AppImagePath.notSugar,
          sizeIcon: 35,
          typeSugar: SugarCoffee.notSugar,
        ),
        SizedBox(width: 15),
        _ItemSugar(
          pathIcon: AppImagePath.oneSugar,
          sizeIcon: 30,
          typeSugar: SugarCoffee.oneSugar,
        ),
        SizedBox(width: 15),
        _ItemSugar(
          pathIcon: AppImagePath.twoSugar,
          sizeIcon: 40,
          typeSugar: SugarCoffee.twoSugar,
        ),
        SizedBox(width: 15),
        _ItemSugar(
          pathIcon: AppImagePath.threeSugar,
          sizeIcon: 40,
          typeSugar: SugarCoffee.threeSugar,
        ),
      ],
    );
  }
}

class _ItemSugar extends StatelessWidget {
  const _ItemSugar({
    required this.pathIcon,
    required this.sizeIcon,
    required this.typeSugar,
  });
  final String pathIcon;
  final double sizeIcon;
  final SugarCoffee typeSugar;

  @override
  Widget build(BuildContext context) {
    final colorIcon = context.select<ItemCoffeeBloc, SugarCoffee>(
                (value) => value.state.sugar) ==
            typeSugar
        ? sizeSelectColor
        : sizeUnSelectColor;
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: ColorTween(begin: colorIcon, end: colorIcon),
      builder: (BuildContext context, Color? value, Widget? child) {
        return InkWell(
          onTap: () => context
              .read<ItemCoffeeBloc>()
              .add(ItemCoffeeSugarEvent(sugar: typeSugar)),
          child: SvgPicture.asset(
            pathIcon,
            width: sizeIcon,
            colorFilter: ColorFilter.mode(
              value as Color,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
