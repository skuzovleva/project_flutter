import 'package:flutter/material.dart';

import '../coffee_theme.dart';
import 'order_components.dart';

class OrderItem extends StatefulWidget {
  OrderItem({
    super.key,
    required this.price,
    required this.name,
    required this.nameSubtitle,
    required this.imagePicture,
  });

  final double price;
  final String name;
  final String nameSubtitle;
  final String imagePicture;
  int countNumber = 1;

  double getTotalPrice() {
    return price * countNumber;
  }

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      alignment: Alignment.topLeft,
      width: screenSize.width * 0.85,
      height: screenSize.height * 0.066,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: screenSize.width * 0.85,
        child: Row(
          children: [
            Image(
              image: AssetImage(widget.imagePicture),
              width: screenSize.width * 0.144,
              height: screenSize.width * 0.144,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoffeeText(
                  text: widget.name,
                  color: CoffeeColors().textBlack,
                  isBold: true,
                  size: 16,
                ),
                CoffeeText(
                  text: widget.nameSubtitle,
                  color: CoffeeColors().textGrey,
                  isBold: false,
                  size: 12,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: screenSize.height * 0.0344,
              child: Row(
                children: [
                  myIconButton('-'),
                  SizedBox(
                    width: 35,
                    child: Center(
                      child: CoffeeText(
                        text: '${widget.countNumber}',
                        color: CoffeeColors().textBlack,
                        isBold: true,
                        size: 14,
                      ),
                    ),
                  ),
                  myIconButton('+'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myIconButton(String sign) {
    return IconButton(
      onPressed: () {
        setState(() {
          sign == '+'
              ? widget.countNumber++
              : widget.countNumber > 0
                  ? widget.countNumber--
                  : widget.countNumber = widget.countNumber;
        });
      },
      icon: Icon(sign == '+' ? Icons.add : Icons.remove),
      iconSize: 16,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          CircleBorder(
            side: BorderSide(
              width: 1,
              color: CoffeeColors().greyBorder,
            ),
          ),
        ),
      ),
    );
  }
}
