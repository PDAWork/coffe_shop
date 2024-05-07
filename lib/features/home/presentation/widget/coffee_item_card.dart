import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/coffee.dart';
import 'package:coffee_shop/core/entity/item_coffee_entity.dart';
import 'package:coffee_shop/core/state_managment/bloc/basket_coffee_bloc.dart';
import 'package:coffee_shop/router/app_router.dart';
import 'package:coffee_shop/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CoffeeItemCard extends StatelessWidget {
  const CoffeeItemCard({
    super.key,
    required ItemCoffeeEntity itemCoffee,
  }) : _itemCoffee = itemCoffee;

  final ItemCoffeeEntity _itemCoffee;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.router.goNamed(
          Pages.itemCoffee.screenName,
          extra: {
            "bloc": context.read<BasketCoffeeBloc>(),
            "itemCoffee": _itemCoffee,
            "typeAction": true,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: filedFieldSearch,
          border: Border.all(color: primary),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(_itemCoffee.coffee.iconPath),
            Text(
              _itemCoffee.coffee.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "${_itemCoffee.coffee.price} ₽",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w900, color: primary),
            ),
          ],
        ),
      ),
    );
  }
}
