import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/core/state_managment/bloc/basket_coffee_bloc.dart';
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
        final itemList = state.bascketItem;
        return ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 5),
                      child: SizedBox.expand(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: editButtonBackground,
                            foregroundColor: editIconColor,
                          ),
                          child: const Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 5),
                      child: SizedBox.expand(
                        child: OutlinedButton(
                          onPressed: () {
                            context.read<BasketCoffeeBloc>().add(
                                  BasketCoffeeDeleteEvent(
                                    item: itemList[index],
                                  ),
                                );
                            controller.close();
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: deleteButtonBackground,
                            foregroundColor: deleteIconColor,
                          ),
                          child: const Icon(Icons.delete),
                        ),
                      ),
                    ),
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
