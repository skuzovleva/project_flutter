import 'package:coffee_shop/Components/notification_background.dart';
import 'package:coffee_shop/Components/notification_item.dart';
import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: CoffeeColors().myBrown,
        title: const CoffeeText(
          text: 'Notification Center',
          size: 18,
          isBold: true,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(174, 109, 69, 1),
        toolbarHeight: screenHeight * 0.05,
      ),
      body: Stack(
        children: [
          const Offstage(
            offstage: false,
            child: NotificationsBackground(),
          ),
          const Offstage(
            offstage: false,
            child: Scaffold(
              backgroundColor: Colors.black12,
            ),
          ),
          Offstage(
            offstage: false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage(
                              'assets/pictures/CoffeeTransparent.png'),
                          height: screenHeight * 0.25,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CoffeeText(
                              text: 'Hello',
                              size: 32,
                              isBold: true,
                              color: Colors.white,
                            ),
                            CoffeeText(
                              text: 'There,',
                              size: 32,
                              isBold: true,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: double.infinity,
                    ),
                    const NotificationItem(
                      text: 'Your coffee is ready for pickup!',
                      icon: Icons.check,
                    ),
                    const NotificationItem(
                      text: 'Enjoy your limited discount!',
                      icon: Icons.discount_outlined,
                    ),
                    const NotificationItem(
                      text: 'Don’t miss out on our limited offer!',
                      icon: Icons.star_rate_outlined,
                    ),
                    const NotificationItem(
                      text: 'How about a coffee break?',
                      icon: Icons.coffee,
                    ),
                    const NotificationItem(
                      text: 'Try our new Pumpkin Spice Latte!',
                      icon: Icons.assignment_outlined,
                    ),
                    const NotificationItem(
                      text: 'Enjoy a discounted coffee today!',
                      icon: Icons.star_border_outlined,
                    ),
                    const NotificationItem(
                      text: 'We will be open late this Friday for...',
                      icon: Icons.more_time,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
