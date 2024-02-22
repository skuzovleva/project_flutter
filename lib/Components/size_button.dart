import 'package:coffee_shop/Components/coffee_snackbar.dart';
import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  const SizeButton({super.key, required this.size});

  final String size;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        if (size != 'M') {
          ScaffoldMessenger.of(context).showSnackBar(
            coffeeSnackBar('Sorry only (M)edium size is available'),
          );
        }
      },
      splashColor: CoffeeColors().myBrown,
      overlayColor: MaterialStatePropertyAll(CoffeeColors().myBrown),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: screenWidth * 0.25,
        height: screenHeight * 0.07,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: size == 'M' ? Colors.orange.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color:
                size == 'M' ? CoffeeColors().myBrown : CoffeeColors().textGrey,
          ),
        ),
        child: CoffeeText(
          text: size,
          color:
              size == 'M' ? CoffeeColors().myBrown : CoffeeColors().textBlack,
          isBold: true,
          size: 20,
        ),
      ),
    );
  }
}
