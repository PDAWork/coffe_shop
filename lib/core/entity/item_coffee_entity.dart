import 'package:coffee_shop/common/coffee.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:equatable/equatable.dart';

final class ItemCoffeeEntity extends Equatable {
  final Coffee coffee;
  int count;
  int totalPrice;
  final SizeCoffee size;
  final SugarCoffee sugar;

  ItemCoffeeEntity({
    required this.coffee,
    required this.count,
    required this.totalPrice,
    required this.size,
    required this.sugar,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [coffee, size, sugar];
}
