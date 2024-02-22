import 'package:coffee_shop/Data/cart.dart';
import 'package:coffee_shop/Components/order_item.dart';
import 'package:coffee_shop/Data/favourite_list.dart';
import 'package:coffee_shop/Models/coffee_model.dart';
import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/Screens/details.dart';
import 'package:coffee_shop/Screens/favourites.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/coffee_data.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({
    super.key,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: coffeeList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: screenHeight * 0.34,
      ),
      itemBuilder: (context, index) {
        CoffeeModel coffeeModel = coffeeList[index];
        return Coffee(
          coffeeModel: coffeeModel,
          onPressed: (list) {},
        );
      },
    );
  }
}

class Coffee extends StatefulWidget {
  Coffee({
    super.key,
    required this.coffeeModel,
    required this.onPressed,
  });

  final CoffeeModel coffeeModel;
  final void Function(List<Widget>) onPressed;
  bool favourite = false;
  bool isAdded = false;
  int index = 0;

  @override
  State<Coffee> createState() => _CoffeeState();
}

class _CoffeeState extends State<Coffee> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(coffeeModel: widget.coffeeModel),
        ),
      ),
      child: Container(
        height: screenHeight * 0.3,
        width: screenWidth * 0.4,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: widget.coffeeModel.imgPath,
                      child: Container(
                        height: screenHeight * 0.2,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.coffeeModel.imgPath),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[600],
                                size: 13,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                widget.coffeeModel.rate.toString(),
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffeeModel.name,
                        style: GoogleFonts.sora(
                          color: CoffeeColors().textBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      CoffeeText(
                        text: widget.coffeeModel.subName,
                        size: 14,
                        isBold: false,
                        color: CoffeeColors().textGrey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${widget.coffeeModel.price.toStringAsFixed(2)}',
                            style: GoogleFonts.sora(
                              // fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  widget.coffeeModel.isFavourite =
                                      !widget.coffeeModel.isFavourite;
                                  if (widget.coffeeModel.isFavourite) {
                                    favourites.add(widget.coffeeModel);
                                  } else {
                                    favourites.removeWhere((element) {
                                      return element.price ==
                                          widget.coffeeModel.price;
                                    });
                                  }
                                });
                              },
                              child: Icon(
                                //TODO: Make Heart filled (Icons.favorite) when added to fav page
                                widget.coffeeModel.isFavourite
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_outline_rounded,
                                size: 32,
                                color: widget.coffeeModel.isFavourite
                                    ? Colors.red
                                    : CoffeeColors().textBlack,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (widget.isAdded) {
                                  cart.removeWhere((element) {
                                    return element.price ==
                                        widget.coffeeModel.price;
                                  });
                                } else {
                                  cart.add(
                                    OrderItem(
                                      name: widget.coffeeModel.name,
                                      nameSubtitle: widget.coffeeModel.subName,
                                      price: widget.coffeeModel.price,
                                      imagePicture: widget.coffeeModel.imgPath,
                                    ),
                                  );
                                  // widget.index = widget.coffeeModel.price;
                                }
                                widget.isAdded = (!widget.isAdded);
                                widget.onPressed(cart);
                              });
                            },
                            child: Container(
                              height: screenHeight * 0.04,
                              width: screenWidth * 0.075,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: CoffeeColors().myBrown,
                              ),
                              child: Icon(
                                widget.isAdded ? Icons.remove : Icons.add,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
