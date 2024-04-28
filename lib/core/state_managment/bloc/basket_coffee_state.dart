part of 'basket_coffee_bloc.dart';

@immutable
final class BasketCoffeeState {
  final List<ItemCoffeeEntity> bascketItem;
  int get countItem => bascketItem.length;

  int get totalPrice => bascketItem.fold<int>(
        0,
        (previousValue, element) => previousValue + element.totalPrice,
      );

  const BasketCoffeeState({
    required this.bascketItem,
  });

  BasketCoffeeState copyWith({List<ItemCoffeeEntity>? bascketItem}) {
    return BasketCoffeeState(bascketItem: bascketItem ?? this.bascketItem);
  }
}
