import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:coffee_shop/router/app_router.dart';
import 'package:coffee_shop/router/router_utils.dart';
import 'package:flutter/material.dart';

class CoffeeItemCard extends StatelessWidget {
  const CoffeeItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.router.goNamed(Pages.itemCoffee.screenName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: filedFieldSearch,
          border: Border.all(color: primary),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        height: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            galao,
            Text(
              'Latte',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '200 ₽',
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
