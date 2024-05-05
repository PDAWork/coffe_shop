// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:coffee_shop/common/coffee.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';

final class ItemCoffeeEntity extends Equatable {
  final Coffee coffee;
  final int count;
  final int totalPrice;
  final SizeCoffee size;
  final SugarCoffee sugar;

  const ItemCoffeeEntity({
    required this.coffee,
    required this.count,
    required this.totalPrice,
    required this.size,
    required this.sugar,
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
