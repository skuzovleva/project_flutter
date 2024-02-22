import 'package:flutter/material.dart';

import '../coffee_theme.dart';
import 'order_components.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(35),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(35),
          shadowColor: CoffeeColors().myBrown,
          child: Container(
            width: screenWidth * .85,
            height: screenHeight * 0.08,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: CoffeeColors().myBrown,
                ),
                const SizedBox(
                  width: 10,
                ),
                CoffeeText(
                  text: text,
                  size: 12,
                  isBold: false,
                  color: CoffeeColors().textBlack,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: CoffeeColors().myBrown,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
