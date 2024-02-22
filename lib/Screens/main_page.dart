import 'package:coffee_shop/Screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../coffee_theme.dart';
import '../Components/order_components.dart';
import '../Components/categories.dart';
import '../Components/GridView_Component.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(color: Color(0xff1C1C1C)),
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: screenWidth * 0.85,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CoffeeText(
                                  text: 'Location',
                                  color: CoffeeColors().textGrey,
                                  isBold: false,
                                  size: 16,
                                ),
                                const CoffeeText(
                                  text: 'Cairo, Egypt',
                                  color: Colors.white,
                                  isBold: true,
                                  size: 18,
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Profile(),
                                ),
                              ),
                              child: const Hero(
                                tag: 'Profile Picture',
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/pictures/ProfilePicture.jpg',
                                  ),
                                  radius: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: screenHeight * 0.064,
                        width: screenWidth * 0.85,
                        child: TextFormField(
                          style: GoogleFonts.sora(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xff313131),
                            hintText: 'Search coffee',
                            hintStyle: GoogleFonts.sora(
                              color: CoffeeColors().textGrey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                top: 240,
                left: 0,
                right: 0,
                child: Image(
                  image: const AssetImage('assets/pictures/HomePromo.png'),
                  width: screenWidth * 0.85,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            width: screenWidth * 0.85,
            alignment: Alignment.topLeft,
            child: const Categories(),
          ),
          SizedBox(
            width: screenWidth * 0.85,
            child: const CustomGridView(),
          ),
        ],
      ),
    );
  }
}
