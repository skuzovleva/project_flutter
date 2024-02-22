import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedItem = 0;

  Widget buildCategories() {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ['Cappuccino', 'Machiato', 'Latte']
          .asMap()
          .map(
            (key, value) => MapEntry(
              key,
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem = key;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.047,
                  width: screenWidth * 0.25,
                  decoration: BoxDecoration(
                      color: selectedItem == key
                          ? CoffeeColors().myBrown
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: CoffeeText(
                    text: value,
                    color: selectedItem == key
                        ? Colors.white
                        : CoffeeColors().textBlack,
                    size: 12,
                    isBold: true,
                  ),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildCategories();
  }
}
