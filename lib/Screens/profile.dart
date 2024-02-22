import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  color: CoffeeColors().myBrown,
                  image: DecorationImage(
                    image: AssetImage('assets/pictures/Profilebackground.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(60),
                  ),
                ),
              ),
              Positioned(
                bottom: -screenWidth * 0.12,
                child: Hero(
                  tag: 'Profile Picture',
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/pictures/ProfilePicture.jpg'),
                      radius: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              width: screenWidth * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  CoffeeText(
                    text: 'MARS',
                    size: 32,
                    isBold: true,
                    color: CoffeeColors().textBlack,
                  ),
                  CoffeeText(
                    text: 'Maryam Aya Rahma Rawan Salma',
                    size: 16,
                    isBold: false,
                    color: CoffeeColors().textBlack,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: CoffeeColors().myBrown,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CoffeeText(
                        text: 'Description',
                        size: 20,
                        isBold: false,
                        color: CoffeeColors().textBlack,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CoffeeText(
                        text:
                            'Please don\'t read ChatGPT made description 😂\n',
                        size: 8,
                        isBold: false,
                        color: CoffeeColors().textGrey,
                      ),
                    ],
                  ),
                  CoffeeText(
                    text:
                        'Meet The Brew Crew, a group of five coffee enthusiasts: '
                        'Espresso Maryam, the barista and espresso expert; '
                        'Latte Aya, the artist who believes in the beauty of presentation; '
                        'Mocha Rahma, the chocolate lover who experiments with mocha blends; '
                        'Cappuccino Rawan, the lover of frothy cappuccinos seeking the perfect foam-to-espresso ratio;'
                        'Americano Salma, the purist who prefers her coffee simple and strong. Together, they explore the world of coffee, brewing, tasting, and discovering the magic in every cup. ☕',
                    size: 12,
                    isBold: false,
                    color: CoffeeColors().textGrey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
