import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class DiscountAlert extends StatelessWidget {
  const DiscountAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: CoffeeColors().myBrown,
      titlePadding: const EdgeInsets.all(35),
      title: CoffeeText(
        text: '50% Discount on Delivery Fees for new customers!',
        size: 18,
        color: CoffeeColors().textBlack,
        isBold: true,
      ),
    );
  }
}
