import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class NotificationsBackground extends StatelessWidget {
  const NotificationsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: screenHeight * 0.3,
        decoration: BoxDecoration(
          color: CoffeeColors().myBrown,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(45),
          ),
        ),
      ),
    );
  }
}
