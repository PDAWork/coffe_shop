import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SugarCoffeeWidget extends StatelessWidget {
  const SugarCoffeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(
          builder: (context, state) {
            return InkWell(
              onTap: () => context
                  .read<ItemCoffeeBloc>()
                  .add(ItemCoffeeSugarEvent(sugar: SugarCoffee.notSugar)),
              child: notSugar(
                color: state.sugar == SugarCoffee.notSugar
                    ? sizeSelectColor
                    : sizeUnSelectColor,
              ),
            );
          },
        ),
        const SizedBox(width: 15),
        BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(
          builder: (context, state) {
            return InkWell(
              onTap: () => context
                  .read<ItemCoffeeBloc>()
                  .add(ItemCoffeeSugarEvent(sugar: SugarCoffee.oneSugar)),
              child: oneSugar(
                color: state.sugar == SugarCoffee.oneSugar
                    ? sizeSelectColor
                    : sizeUnSelectColor,
              ),
            );
          },
        ),
        const SizedBox(width: 15),
        BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(
          builder: (context, state) {
            return InkWell(
              onTap: () => context
                  .read<ItemCoffeeBloc>()
                  .add(ItemCoffeeSugarEvent(sugar: SugarCoffee.twoSugar)),
              child: twoSugar(
                color: state.sugar == SugarCoffee.twoSugar
                    ? sizeSelectColor
                    : sizeUnSelectColor,
              ),
            );
          },
        ),
        const SizedBox(width: 15),
        BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(
          builder: (context, state) {
            return InkWell(
              onTap: () => context
                  .read<ItemCoffeeBloc>()
                  .add(ItemCoffeeSugarEvent(sugar: SugarCoffee.threeSugar)),
              child: threeSugar(
                color: state.sugar == SugarCoffee.threeSugar
                    ? sizeSelectColor
                    : sizeUnSelectColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
