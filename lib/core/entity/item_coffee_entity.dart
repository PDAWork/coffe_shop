// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:coffee_shop/common/coffee.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:flutter/material.dart';

final class ItemCoffeeEntity extends Equatable {
  final UniqueKey _id = UniqueKey();

  UniqueKey get id => _id;

  final Coffee coffee;
  final int count;
  final int totalPrice;
  final SizeCoffee size;
  final SugarCoffee sugar;

  ItemCoffeeEntity({
    required this.coffee,
    this.count = 0,
    this.totalPrice = 0,
    this.size = SizeCoffee.small,
    this.sugar = SugarCoffee.notSugar,
  });

  @override
  List<Object?> get props => [coffee, size, sugar];

  ItemCoffeeEntity copyWith({
    Coffee? coffee,
    int? count,
    int? totalPrice,
    SizeCoffee? size,
    SugarCoffee? sugar,
  }) {
    return ItemCoffeeEntity(
      coffee: coffee ?? this.coffee,
      count: count ?? this.count,
      totalPrice: totalPrice ?? this.totalPrice,
      size: size ?? this.size,
      sugar: sugar ?? this.sugar,
    );
  }
}
