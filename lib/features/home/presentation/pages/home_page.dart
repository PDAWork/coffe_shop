import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/coffee.dart';
import 'package:coffee_shop/features/home/presentation/widget/coffee_item_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  hintStyle: const TextStyle(color: primary),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 0,
                  ),
                  filled: true,
                  fillColor: filedFieldSearch,
                  constraints: const BoxConstraints(maxHeight: 54),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 54,
              child: FloatingActionButton(
                onPressed: () {},
                elevation: 0,
                backgroundColor: primary,
                child: const Icon(
                  Icons.search,
                  color: filedFieldSearch,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8 // Number of columns in the grid
                ),
            itemCount: Coffee.values.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: CoffeeItemCard(Coffee.values[index]));
            },
          ),
        ),
      
      ],
    );
  }
}
