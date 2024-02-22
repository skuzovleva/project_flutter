import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class CoffeeSnackBar extends StatelessWidget {
  const CoffeeSnackBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: CoffeeText(
        text: text,
        color: Colors.white,
        isBold: false,
        size: 16,
      ),
      duration: const Duration(milliseconds: 800),
      behavior: SnackBarBehavior.floating,
      backgroundColor: CoffeeColors().myBrown,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }
}

SnackBar coffeeSnackBar(String text) {
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CoffeeText(
          text: text,
          color: Colors.white,
          isBold: false,
          size: 16,
        ),
      ],
    ),
    duration: const Duration(milliseconds: 800),
    behavior: SnackBarBehavior.floating,
    backgroundColor: CoffeeColors().myBrown,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
  );
}
