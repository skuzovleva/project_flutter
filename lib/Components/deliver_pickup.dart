import 'package:coffee_shop/Components/order_components.dart';
import 'package:flutter/material.dart';

import '../coffee_theme.dart';

class Deliver extends StatefulWidget {
  const Deliver({
    super.key,
    required this.text,
    required this.isDeliver,
    required this.subText,
  });

  final String text;
  final String subText;
  final bool isDeliver;

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoffeeText(
            text: widget.text,
            size: 16,
            isBold: true,
            color: CoffeeColors().textBlack,
          ),
          const SizedBox(
            height: 10,
          ),
          CoffeeText(
            text: 'Cairo, Egypt',
            size: 14,
            isBold: true,
            color: CoffeeColors().textBlack,
          ),
          const SizedBox(
            height: 5,
          ),
          CoffeeText(
            text: widget.subText,
            size: 12,
            isBold: false,
            color: CoffeeColors().textGrey,
          ),
          Row(
            children: [
              Visibility(
                visible: widget.isDeliver,
                child: MiniButton(
                  onPressed: () {},
                  text: 'Edit Address',
                  icon: 'assets/icons/EditAddress.png',
                ),
              ),
              Visibility(
                visible: widget.isDeliver,
                child: const SizedBox(
                  width: 7,
                ),
              ),
              MiniButton(
                onPressed: () {},
                text: 'Add Note',
                icon: 'assets/icons/AddNote.png',
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 2,
            width: double.infinity,
            color: CoffeeColors().myGrey,
          ),
        ],
      ),
    );
  }
}
