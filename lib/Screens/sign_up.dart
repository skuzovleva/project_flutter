import 'package:coffee_shop/Components/custom_field.dart';
import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/Screens/home_page.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    void signUserIn() {
      if (_formKey.currentState!.validate()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth,
                    ),
                    Lottie.asset(
                      'assets/pictures/coffeeIdle.json',
                      height: screenHeight * 0.25,
                    ),
                    // welcome back, you've been missed!
                    CoffeeText(
                      text: 'Welcome...!',
                      size: 26,
                      isBold: true,
                      color: CoffeeColors().textBlack,
                    ),
                    const SizedBox(height: 20),
                    const CustomField(
                      obscureText: false,
                      hintTxt: 'Username',
                    ),
                    const SizedBox(height: 10),
                    const CustomField(
                      obscureText: false,
                      hintTxt: 'Email',
                    ),
                    const SizedBox(height: 10),
                    const CustomField(
                      obscureText: false,
                      hintTxt: 'Phone Number',
                    ),
                    const SizedBox(height: 10),
                    const CustomField(
                      obscureText: true,
                      hintTxt: 'Password',
                    ),
                    const SizedBox(height: 20),
                    CoffeeButton(
                      text: 'Sign Up',
                      onPressed: signUserIn,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
