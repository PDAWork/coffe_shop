import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCoffeeWidget extends StatelessWidget {
  const CounterCoffeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => context
              .read<ItemCoffeeBloc>()
              .add(ItemCoffeeCountEvent(isIncrement: false)),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30),
              ),
            ),
            child: const Icon(Icons.remove),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          constraints: const BoxConstraints(minWidth: 50, maxWidth: 55),
          decoration: const BoxDecoration(color: loyaltyCardColor),
          child: BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(
            builder: (context, state) {
              return Text(
                "${state.count}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              );
            },
          ),
        ),
        InkWell(
          onTap: () =>
              context.read<ItemCoffeeBloc>().add(ItemCoffeeCountEvent()),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(30),
              ),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
