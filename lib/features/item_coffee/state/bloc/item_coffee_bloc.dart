import 'package:bloc/bloc.dart';
import 'package:coffee_shop/core/entity/item_coffee_entity.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'item_coffee_event.dart';
part 'item_coffee_state.dart';

class ItemCoffeeBloc extends Bloc<ItemCoffeeEvent, ItemCoffeeState> {
  ItemCoffeeBloc(ItemCoffeeEntity item)
      : super(
          ItemCoffeeState(
            price: item.coffee.price,
            size: item.size,
            sugar: item.sugar,
            count: item.count,
          ),
        ) {
    on<ItemCoffeeEvent>(
      (event, emit) {},
    );
    on<ItemCoffeeCountEvent>(
      (event, emit) {
        if ((state.count > 0 && !event.isIncrement) ||
            (event.isIncrement && state.count < 10)) {
          emit(state.copyWith(
            count: event.isIncrement ? state.count + 1 : state.count - 1,
          ));
        }
      },
    );
    on<ItemCoffeeSizedEvent>(
      (event, emit) {
        emit(state.copyWith(size: event.size));
      },
    );
    on<ItemCoffeeSugarEvent>((event, emit) {
      emit(state.copyWith(sugar: event.sugar));
    });
  }
}
