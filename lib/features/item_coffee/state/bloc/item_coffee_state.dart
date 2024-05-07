part of 'item_coffee_bloc.dart';

enum SizeCoffee {
  small(title: "250 ml", procent: 0),
  medium(title: "350 ml", procent: 20),
  large(title: "450 ml", procent: 30);

  const SizeCoffee({required this.title, required this.procent});
  final String title;
  final int procent;
}

enum SugarCoffee {
  notSugar(title: 'Без сахара'),
  oneSugar(title: "1 сахар"),
  twoSugar(title: "2 сахара"),
  threeSugar(title: '3 сахара');

  const SugarCoffee({required this.title});

  final String title;
}

@immutable
final class ItemCoffeeState {
  final int count;
  final int price;
  final SizeCoffee size;
  final SugarCoffee sugar;

  int get totalPrice => (price * count) + (size.procent * count);

  const ItemCoffeeState({
    this.count = 0,
    required this.price,
    this.size = SizeCoffee.small,
    this.sugar = SugarCoffee.notSugar,
  });

  ItemCoffeeState copyWith({
    int? count,
    int? price,
    SizeCoffee? size,
    SugarCoffee? sugar,
  }) {
    return ItemCoffeeState(
      count: count ?? this.count,
      price: price ?? this.price,
      size: size ?? this.size,
      sugar: sugar ?? this.sugar,
    );
  }

  @override
  String toString() {
    return "ItemCoffeeState(count: $count, price: $price, size: $size, sugar: $sugar, totalPrice: $totalPrice)";
  }
}
