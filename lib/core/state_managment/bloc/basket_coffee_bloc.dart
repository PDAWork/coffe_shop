import 'package:bloc/bloc.dart';
import 'package:coffee_shop/core/entity/item_coffee_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'basket_coffee_event.dart';
part 'basket_coffee_state.dart';

class BasketCoffeeBloc extends Bloc<BasketCoffeeEvent, BasketCoffeeState> {
  BasketCoffeeBloc() : super(const BasketCoffeeState(bascketItem: [])) {
    on<BasketCoffeeEvent>((event, emit) {});
    on<BasketCoffeeAddEvent>(
      (event, emit) {
        final List<ItemCoffeeEntity> bascketItem = [];
        bascketItem.addAll(state.bascketItem);

        final queryCoffeeIndex = bascketItem.indexWhere(
          (element) =>
              element.coffee == event.item.coffee &&
              element.size == event.item.size &&
              element.sugar == event.item.sugar,
        );

        if (queryCoffeeIndex == -1) {
          bascketItem.add(event.item);
        } else {
          var itemCoffee = bascketItem[queryCoffeeIndex];
          bascketItem.replaceRange(queryCoffeeIndex, queryCoffeeIndex+1, [
            itemCoffee.copyWith(
              count: event.item.count + itemCoffee.count,
              totalPrice: event.item.totalPrice + itemCoffee.totalPrice,
            )
          ]);
        }

        emit(state.copyWith(bascketItem: bascketItem));
      },
    );
    on<BasketCoffeeDeleteEvent>((event, emit) {
      final List<ItemCoffeeEntity> basketItem = [];
      basketItem.addAll(state.bascketItem);
      basketItem.remove(event.item);
      emit(state.copyWith(bascketItem: basketItem));
    });
  }
}
