import 'package:coffee_shop/Screens/login_page.dart';
import 'package:flutter/material.dart';

import '../Components/order_components.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: screenWidth * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Image(
                  image: AssetImage(
                    "assets/pictures/OnboardingCoffee.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CoffeeText(
                      text: 'Coffee so good, your taste buds will love it..',
                      size: 34,
                      isBold: true,
                      color: Colors.white,
                    ),
                    const CoffeeText(
                      text:
                          'The best grain, the finest roast, the powerful flavor.',
                      size: 18,
                      isBold: false,
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    CoffeeButton(
                      text: 'Get Started',
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return const LoginPage();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
