import 'package:bloc/bloc.dart';
import 'package:coffee_shop/common/coffee.dart';
import 'package:coffee_shop/core/entity/item_coffee_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'basket_coffee_event.dart';
part 'basket_coffee_state.dart';

class BasketCoffeeBloc extends Bloc<BasketCoffeeEvent, BasketCoffeeState> {
  BasketCoffeeBloc() : super(const BasketCoffeeState(bascketItem: [])) {
    on<BasketCoffeeEvent>((event, emit) {});
    on<BasketCoffeeAddEvent>(
      (event, emit) {
        final List<ItemCoffeeEntity> bascketItem = [];
        bascketItem.addAll(state.bascketItem);

        final queryCoffee = bascketItem.firstWhereOrNull(
          (element) =>
              element.coffee == event.item.coffee &&
              element.size == event.item.size &&
              element.sugar == event.item.sugar,
        );

        if (queryCoffee != null) {
          bascketItem.remove(queryCoffee);
        }

        final item = ItemCoffeeEntity(
          coffee: event.item.coffee,
          count: queryCoffee == null
              ? event.item.count
              : event.item.count + queryCoffee.count,
          totalPrice: queryCoffee == null
              ? event.item.totalPrice
              : event.item.totalPrice + queryCoffee.totalPrice,
          size: event.item.size,
          sugar: event.item.sugar,
        );

        bascketItem.add(item);
        emit(state.copyWith(bascketItem: bascketItem));
      },
    );
  }
}
