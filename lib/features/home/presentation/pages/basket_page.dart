import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/core/entity/item_coffee_entity.dart';
import 'package:coffee_shop/core/state_managment/bloc/basket_coffee_bloc.dart';
import 'package:coffee_shop/router/app_router.dart';
import 'package:coffee_shop/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCoffeeBloc, BasketCoffeeState>(
      builder: (context, state) {
        final itemList = state.basketItem;
        return ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  _ActionSlidable(
                    item: itemList[index],
                    backgroundColor: editButtonBackground,
                    foregroundColor: editIconColor,
                    icon: Icons.edit,
                  ),
                  _ActionSlidable(
                    item: itemList[index],
                    backgroundColor: deleteButtonBackground,
                    foregroundColor: deleteIconColor,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: primary),
                  color: loyaltyCardColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      itemList[index].coffee.iconPath,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemList[index].coffee.name),
                        Text("x ${itemList[index].count}"),
                        Text(
                            "${itemList[index].size.title} | ${itemList[index].sugar.title}"),
                      ],
                    ),
                    const Spacer(),
                    Text("${itemList[index].totalPrice} ₽"),
                  ],
                ),
              ),
            );
            // return ListTile(
            //   leading: SvgPicture.asset(itemList[index].coffee.iconPath),
            //   title: Text(itemList[index].coffee.name),
            //   subtitle: Text(
            //       "1x${itemList[index].coffee.price + itemList[index].size.procent} за ${itemList[index].count} = ${itemList[index].totalPrice}"),
            // );
          },
        );
      },
    );
  }
}

class _ActionSlidable extends StatelessWidget {
  const _ActionSlidable({
    super.key,
    required this.item,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final ItemCoffeeEntity item;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 5),
        child: SizedBox.expand(
          child: OutlinedButton(
            onPressed: () {
              Slidable.of(context)!.close();
              AppRouter.router.goNamed(
                Pages.itemCoffee.screenName,
                extra: {
                  "bloc": context.read<BasketCoffeeBloc>(),
                  "itemCoffee": item,
                  "typeAction": false
                },
              );
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
            ),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
