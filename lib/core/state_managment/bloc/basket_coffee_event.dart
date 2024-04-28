part of 'basket_coffee_bloc.dart';

@immutable
sealed class BasketCoffeeEvent {}

final class BasketCoffeeAddEvent extends BasketCoffeeEvent {
  final ItemCoffeeEntity item;

  BasketCoffeeAddEvent({required this.item});
}
