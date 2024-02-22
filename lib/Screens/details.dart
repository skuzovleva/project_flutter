import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/Components/size_button.dart';
import 'package:coffee_shop/Models/coffee_model.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.coffeeModel});

  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: screenWidth * 0.07),
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: CoffeeText(
          text: 'Details',
          size: 18,
          isBold: true,
          color: CoffeeColors().textBlack,
        ),
        forceMaterialTransparency: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Hero(
                  tag: coffeeModel.imgPath,
                  child: Container(
                    height: screenHeight * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(coffeeModel.imgPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CoffeeText(
                  text: coffeeModel.name,
                  color: CoffeeColors().textBlack,
                  size: 20,
                  isBold: true,
                ),
                CoffeeText(
                  text: coffeeModel.subName,
                  color: CoffeeColors().textGrey,
                  size: 14,
                  isBold: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.orangeAccent,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    CoffeeText(
                      text: coffeeModel.rate.toString(),
                      color: CoffeeColors().textBlack,
                      size: 20,
                      isBold: false,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CoffeeText(
                      text: '(230)',
                      color: CoffeeColors().textGrey,
                      size: 14,
                      isBold: false,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                CoffeeText(
                  text: 'Description',
                  color: CoffeeColors().textBlack,
                  size: 20,
                  isBold: true,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                CoffeeText(
                  text: coffeeModel.description,
                  color: CoffeeColors().textGrey,
                  size: 16,
                  isBold: true,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                CoffeeText(
                  text: 'Size',
                  color: CoffeeColors().textBlack,
                  size: 20,
                  isBold: true,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizeButton(size: 'S'),
                    SizeButton(size: 'M'),
                    SizeButton(size: 'L'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 15,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: Container(
          height: screenHeight * 0.122,
          width: screenWidth * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoffeeText(
                    text: 'Price',
                    size: 14,
                    isBold: true,
                    color: CoffeeColors().textGrey,
                  ),
                  CoffeeText(
                    text: '\$ ${coffeeModel.price}',
                    size: 20,
                    isBold: true,
                    color: CoffeeColors().myBrown,
                  ),
                ],
              ),
              CoffeeButton(
                text: 'Buy Now',
                onPressed: () {},
                width: screenWidth * 0.6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
