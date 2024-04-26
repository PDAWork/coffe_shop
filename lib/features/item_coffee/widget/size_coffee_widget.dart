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
    return BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(
        builder: (context, state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              context
                  .read<ItemCoffeeBloc>()
                  .add(ItemCoffeeSizedEvent(size: SizeCoffee.small));
            },
            child: SizeCard(
              icon: small(
                color: state.size == SizeCoffee.small
                    ? sizeSelectColor
                    : sizeUnSelectColor,
              ),
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
              icon: medium(
                color: state.size == SizeCoffee.medium
                    ? sizeSelectColor
                    : sizeUnSelectColor,
              ),
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
              icon: large(
                color: state.size == SizeCoffee.large
                    ? sizeSelectColor
                    : sizeUnSelectColor,
              ),
              title: "450 ml",
              select: state.size == SizeCoffee.large
                  ? sizeSelectColor
                  : sizeUnSelectColor,
            ),
          ),
        ],
      );
    });
  }
}
