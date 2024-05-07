part of 'basket_coffee_bloc.dart';

@immutable
final class BasketCoffeeState {
  final List<ItemCoffeeEntity> basketItem;
  int get countItem => basketItem.length;

  int get totalPrice => basketItem.fold<int>(
        0,
        (previousValue, element) => previousValue + element.totalPrice,
      );

  const BasketCoffeeState({
    required this.basketItem,
  });

  BasketCoffeeState copyWith({List<ItemCoffeeEntity>? bascketItem}) {
    return BasketCoffeeState(basketItem: bascketItem ?? this.basketItem);
  }

  @override
  String toString() {
    return "BasketCoffeeState(bascketItem: $basketItem, countItem: $countItem, totalPrice: $totalPrice)";
  }
}
