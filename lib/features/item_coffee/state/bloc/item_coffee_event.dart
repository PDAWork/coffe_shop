part of 'item_coffee_bloc.dart';

@immutable
sealed class ItemCoffeeEvent {}

final class ItemCoffeeCountEvent extends ItemCoffeeEvent {
  final bool isIncrement;

  ItemCoffeeCountEvent({this.isIncrement = true});
}

final class ItemCoffeeSizedEvent extends ItemCoffeeEvent {
  final SizeCoffee size;
  ItemCoffeeSizedEvent({required this.size});
}

final class ItemCoffeeSugarEvent extends ItemCoffeeEvent {
  final SugarCoffee sugar;

  ItemCoffeeSugarEvent({required this.sugar});
}
