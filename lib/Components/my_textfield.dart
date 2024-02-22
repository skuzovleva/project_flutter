import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class CoffeeTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  const CoffeeTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.85,
      child: TextFormField(
        obscureText: obscureText,
        validator: (val) {
          if (val == null || val.isEmpty) return 'Please fill this field';
          if (hintText == 'Password') {
            return (val.toLowerCase() != '1234')
                ? ('$hintText is incorrect')
                : (null);
          } else {
            return (val.toLowerCase() != 'mars')
                ? ('$hintText is incorrect')
                : (null);
          }
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CoffeeColors().myBrown),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
