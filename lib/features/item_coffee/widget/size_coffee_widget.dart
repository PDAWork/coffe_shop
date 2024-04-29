import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:coffee_shop/features/item_coffee/widget/sized_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCoffeeWidget extends StatelessWidget {
  const SizeCoffeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(builder: (ctx, state) {
      return Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context
                      .read<ItemCoffeeBloc>()
                      .add(ItemCoffeeSizedEvent(size: SizeCoffee.small));
                },
                child: SizeCard(
                  iconPath: AppImagePath.small,
                  title: "250 ml",
                  select: state.size == SizeCoffee.small
                      ? sizeSelectColor
                      : sizeUnSelectColor,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  context
                      .read<ItemCoffeeBloc>()
                      .add(ItemCoffeeSizedEvent(size: SizeCoffee.medium));
                },
                child: SizeCard(
                  iconPath: AppImagePath.medium,
                  title: "350 ml",
                  select: state.size == SizeCoffee.medium
                      ? sizeSelectColor
                      : sizeUnSelectColor,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  context
                      .read<ItemCoffeeBloc>()
                      .add(ItemCoffeeSizedEvent(size: SizeCoffee.large));
                },
                child: SizeCard(
                  iconPath: AppImagePath.large,
                  title: "450 ml",
                  select: state.size == SizeCoffee.large
                      ? sizeSelectColor
                      : sizeUnSelectColor,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
