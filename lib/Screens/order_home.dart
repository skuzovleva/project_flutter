import 'package:coffee_shop/Components/coffee_snackbar.dart';
import 'package:coffee_shop/Components/discount_alert.dart';
import 'package:coffee_shop/Data/cart.dart';
import 'package:coffee_shop/Components/order_item.dart';
import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/deliver_pickup.dart';

class OrderHome extends StatefulWidget {
  const OrderHome({super.key, required this.updateIndex});

  final void Function(int) updateIndex;

  @override
  State<OrderHome> createState() => _OrderHomeState();
}

class _OrderHomeState extends State<OrderHome> {
  void updateListOfOrders(List<OrderItem> newOrderItemList) {
    setState(() {
      cart = newOrderItemList;
    });
  }

  double priceTotal = 0;

  void updatePrice() {
    priceTotal = 0;
    for (OrderItem element in cart) {
      setState(() {
        priceTotal += element.getTotalPrice();
      });
    }
  }

  void clearCart() {
    setState(() {
      cart.clear();
      widget.updateIndex(0);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      coffeeSnackBar('Cleared Successfully'),
    );
  }

  int selectedIndex = 1;
  int countNumber = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Deliver(
        text: 'The Nearest Pick Up',
        subText: 'Street 53, Shubra El Kheima',
        isDeliver: false,
      ),
      const Deliver(
        text: 'Delivery Address',
        subText: 'House No. 25, Shubra El Kheima',
        isDeliver: true,
      ),
    ];

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Order',
          style: GoogleFonts.sora(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: screenSize.width * 0.85,
                height: screenSize.height * 0.06,
                padding: const EdgeInsets.symmetric(
                  horizontal: 3,
                ),
                decoration: BoxDecoration(
                  color: CoffeeColors().myGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    swapPages(
                      screenSize.width * 0.42,
                      screenSize.height * 0.05,
                      1,
                      'Deliver',
                    ),
                    swapPages(
                      screenSize.width * 0.41,
                      screenSize.height * 0.05,
                      0,
                      'Pick Up',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.85,
                child: pages[selectedIndex],
              ),
              ListView.builder(
                itemCount: cart.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Center(
                  child: cart[index],
                ),
              ),
              Visibility(
                visible: cart.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      Image(
                        image:
                            const AssetImage('assets/pictures/emptyCart.png'),
                        width: screenSize.width * 0.5,
                      ),
                      CoffeeText(
                        text: 'Your Cart is Empty',
                        size: 32,
                        isBold: true,
                        color: CoffeeColors().textBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: cart.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CoffeeButton(text: 'Clear Cart', onPressed: clearCart),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 5,
                width: double.infinity,
                color: CoffeeColors().myGrey,
              ),
              Container(
                width: screenSize.width * 0.85,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: selectedIndex == 1 ? true : false,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.all(15),
                        width: screenSize.width * 0.85,
                        height: screenSize.height * 0.069,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2,
                            color: CoffeeColors().myGrey,
                          ),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: discountPress,
                          child: Row(
                            children: [
                              Image(
                                image: const AssetImage(
                                    'assets/icons/Discount.png'),
                                width: screenSize.width * 0.05,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              CoffeeText(
                                text: '1 Discount is applied',
                                size: 16,
                                isBold: true,
                                color: CoffeeColors().textBlack,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: CoffeeColors().textBlack,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: CoffeeButton(
                        text: 'Order',
                        onPressed: () {
                          updatePrice();
                          showModalBottomSheet(
                            context: context,
                            elevation: 20,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) => Container(
                              height: screenSize.height * 0.4,
                              width: screenSize.width,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: SizedBox(
                                    width: screenSize.width * 0.85,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CoffeeText(
                                          text: 'Payment Summary',
                                          size: 16,
                                          isBold: true,
                                          color: CoffeeColors().textBlack,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            CoffeeText(
                                              text: 'Price',
                                              size: 14,
                                              isBold: false,
                                              color: CoffeeColors().textBlack,
                                            ),
                                            const Spacer(),
                                            CoffeeText(
                                              text:
                                                  '\$ ${priceTotal.toStringAsFixed(1)}',
                                              size: 14,
                                              isBold: true,
                                              color: CoffeeColors().textBlack,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CoffeeText(
                                              text: 'Delivery Fee',
                                              size: 14,
                                              isBold: false,
                                              color: CoffeeColors().textBlack,
                                            ),
                                            const Spacer(),
                                            Text(
                                              '\$ 2.0  ',
                                              style: GoogleFonts.sora(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            CoffeeText(
                                              text:
                                                  '\$ ${selectedIndex.toDouble()}',
                                              size: 14,
                                              isBold: true,
                                              color: CoffeeColors().textBlack,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          height: 2,
                                          width: screenSize.width * 0.85,
                                          color: CoffeeColors().myGrey,
                                        ),
                                        Row(
                                          children: [
                                            CoffeeText(
                                              text: 'Total Payment',
                                              size: 14,
                                              isBold: false,
                                              color: CoffeeColors().textBlack,
                                            ),
                                            const Spacer(),
                                            CoffeeText(
                                              text:
                                                  '\$ ${(priceTotal + selectedIndex).toStringAsFixed(1)}',
                                              size: 14,
                                              isBold: true,
                                              color: CoffeeColors().textBlack,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            ImageIcon(
                                              const AssetImage(
                                                  'assets/icons/Cash.png'),
                                              color: CoffeeColors().myBrown,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            CashBottomNavigation(
                                              cash: (priceTotal + selectedIndex)
                                                  .toStringAsFixed(2),
                                            ),
                                            const Spacer(),
                                            const Icon(Icons.more_horiz),
                                          ],
                                        ),
                                        CoffeeButton(
                                          text: 'Check Out',
                                          onPressed: () {
                                            setState(() {
                                              cart.clear();
                                              widget.updateIndex(0);
                                            });
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              coffeeSnackBar(
                                                  'Ordered Successfully'),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget swapPages(double width, double height, int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: (selectedIndex == index
              ? CoffeeColors().myBrown
              : CoffeeColors().myGrey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.sora(
              fontWeight: (selectedIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal),
              fontSize: 16,
              color: (selectedIndex == index ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void discountPress() {
    showDialog(
      context: context,
      builder: (context) => const DiscountAlert(),
    );
  }
}
