import 'package:coffee_shop/core/state_managment/bloc/basket_coffee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCoffeeBloc, BasketCoffeeState>(
      builder: (context, state) {
        final itemList = state.bascketItem;
        return ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: SvgPicture.asset(itemList[index].coffee.iconPath),
              title: Text(itemList[index].coffee.name),
              subtitle: Text(
                  "1x${itemList[index].coffee.price + itemList[index].size.procent} за ${itemList[index].count} = ${itemList[index].totalPrice}"),
            );
          },
        );
      },
    );
  }
}
