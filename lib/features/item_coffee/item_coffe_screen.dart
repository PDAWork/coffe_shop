import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/coffee.dart';
import 'package:coffee_shop/core/entity/item_coffee_entity.dart';
import 'package:coffee_shop/core/state_managment/bloc/basket_coffee_bloc.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:coffee_shop/features/item_coffee/widget/counter_coffee_widget.dart';
import 'package:coffee_shop/features/item_coffee/widget/size_coffee_widget.dart';
import 'package:coffee_shop/features/item_coffee/widget/sugar_coffee_widget.dart';
import 'package:coffee_shop/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCoffeeScreen extends StatelessWidget {
  const ItemCoffeeScreen(
    this._coffee, {
    super.key,
  });

  final Coffee _coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_coffee.name),
      ),
      body: Stack(
        children: [
          Image.asset('images/background.png'),
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 200,
                  ),
                  child: SvgPicture.asset(_coffee.iconPath),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              _coffee.name,
                              style: Theme.of(context).textTheme.headlineSmall!,
                            ),
                          ),
                          Text(
                            "${context.read<ItemCoffeeBloc>().state.price} ₽",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Размер',
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          const Spacer(),
                          const SizeCoffeeWidget()
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Сахар',
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          const Spacer(),
                          const SugarCoffeeWidget(),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(
                            builder: (context, state) {
                              return Text(
                                'Итог:  ${state.totalPrice} ₽',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: primary,
                                    ),
                              );
                            },
                          ),
                          const Spacer(),
                          const CounterCoffeeWidget(),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          final item = ItemCoffeeEntity(
                            coffee: _coffee,
                            count: context.read<ItemCoffeeBloc>().state.count,
                            totalPrice:
                                context.read<ItemCoffeeBloc>().state.totalPrice,
                            size: context.read<ItemCoffeeBloc>().state.size,
                            sugar: context.read<ItemCoffeeBloc>().state.sugar,
                          );
                          if (item.count == 0) return;
                          context
                              .read<BasketCoffeeBloc>()
                              .add(BasketCoffeeAddEvent(item: item));
                          AppRouter.router.pop();
                        },
                        child: const Text('AddToCart'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
