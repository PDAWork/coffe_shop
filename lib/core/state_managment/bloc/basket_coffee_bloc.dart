import 'package:bloc/bloc.dart';
import 'package:coffee_shop/core/entity/item_coffee_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'basket_coffee_event.dart';
part 'basket_coffee_state.dart';

class BasketCoffeeBloc extends Bloc<BasketCoffeeEvent, BasketCoffeeState> {
  BasketCoffeeBloc() : super(const BasketCoffeeState(basketItem: [])) {
    on<BasketCoffeeEvent>((event, emit) {});
    on<BasketCoffeeAddEvent>(
      (event, emit) {
        final List<ItemCoffeeEntity> basketItem = [];
        basketItem.addAll(state.basketItem);

        final queryCoffeeIndex = basketItem.indexWhere(
          (element) =>
              element.coffee == event.item.coffee &&
              element.size == event.item.size &&
              element.sugar == event.item.sugar,
        );

        if (queryCoffeeIndex == -1) {
          basketItem.add(event.item);
        } else {
          var itemCoffee = basketItem[queryCoffeeIndex];
          basketItem.replaceRange(queryCoffeeIndex, queryCoffeeIndex + 1, [
            itemCoffee.copyWith(
              count: event.item.count + itemCoffee.count,
              totalPrice: event.item.totalPrice + itemCoffee.totalPrice,
            )
          ]);
        }

        emit(state.copyWith(bascketItem: basketItem));
      },
    );
    on<BasketCoffeeDeleteEvent>((event, emit) {
      final List<ItemCoffeeEntity> basketItem = [];
      basketItem.addAll(state.basketItem);
      basketItem.remove(event.item);
      emit(state.copyWith(bascketItem: basketItem));
    });
    on<BasketCoffeeUpdateEvent>((event, emit) {
      final List<ItemCoffeeEntity> basketItem = [];
      basketItem.addAll(state.basketItem);

      int queryCoffeeIndexNew = basketItem.indexWhere(
        (element) =>
            element.coffee == event.itemNew.coffee &&
            element.size == event.itemNew.size &&
            element.sugar == event.itemNew.sugar,
      );

      if (queryCoffeeIndexNew != -1) {
        var itemCoffee = basketItem[queryCoffeeIndexNew];
        basketItem.replaceRange(queryCoffeeIndexNew, queryCoffeeIndexNew + 1, [
          itemCoffee.copyWith(
            count: event.itemNew.count + itemCoffee.count,
            totalPrice: event.itemNew.totalPrice + itemCoffee.totalPrice,
            size: event.itemNew.size,
            sugar: event.itemNew.sugar,
          )
        ]);
      }

      int queryCoffeeIndexOld = basketItem.indexWhere(
        (element) =>
            element.coffee == event.itemOld.coffee &&
            element.size == event.itemOld.size &&
            element.sugar == event.itemOld.sugar,
      );

      var itemCoffee = basketItem[queryCoffeeIndexOld];
      basketItem.replaceRange(queryCoffeeIndexOld, queryCoffeeIndexOld + 1, [
        itemCoffee.copyWith(
          count: event.itemNew.count,
          totalPrice: event.itemNew.totalPrice,
          size: event.itemNew.size,
          sugar: event.itemNew.sugar,
        )
      ]);
      if (queryCoffeeIndexNew != -1) {
        basketItem.removeAt(queryCoffeeIndexOld);
      }
      emit(state.copyWith(bascketItem: basketItem));
    });
  }
}
