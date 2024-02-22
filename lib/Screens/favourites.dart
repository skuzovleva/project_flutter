import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/Data/coffee_data.dart';
import 'package:coffee_shop/Data/favourite_list.dart';
import 'package:coffee_shop/Models/coffee_model.dart';
import 'package:coffee_shop/Screens/details.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key, required this.updateParent});

  final void Function() updateParent;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.85,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                const SizedBox(
                  width: double.infinity,
                ),
                Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade100,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: CoffeeColors().myBrown,
                      width: 3,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/pictures/FavouriteImage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CoffeeText(
                  text: 'Your Coffee Picks',
                  size: 36,
                  isBold: true,
                  color: CoffeeColors().myBrown,
                ),
                FavouriteListView(),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Visibility(
                  visible: favourites.isEmpty,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/pictures/CoffeeHeart3.png',
                        ),
                        width: screenWidth * 0.5,
                      ),
                      CoffeeText(
                        text:
                            'See a coffee you love? \nJust tap the little heart to add it to your favourites!',
                        size: 14,
                        isBold: true,
                        color: CoffeeColors().textBlack,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        CoffeeModel coffeeModel = favourites[index];
        return FavouriteItem(coffeeModel: coffeeModel);
      },
      itemCount: favourites.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key, required this.coffeeModel});

  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(coffeeModel: coffeeModel),
            ),
          ),
          splashColor: CoffeeColors().myBrown,
          overlayColor: MaterialStatePropertyAll(CoffeeColors().myBrown),
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            width: screenWidth * 0.85,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                  width: 2,
                  color: CoffeeColors().myBrown,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage(coffeeModel.imgPath),
                radius: 30,
              ),
              title: Row(
                children: [
                  CoffeeText(
                    text: coffeeModel.name,
                    color: CoffeeColors().textBlack,
                    size: 14,
                    isBold: true,
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  CoffeeText(
                    text: coffeeModel.subName,
                    color: CoffeeColors().textGrey,
                    size: 10,
                    isBold: false,
                  ),
                ],
              ),
              trailing: CoffeeText(
                text: '\$ ${coffeeModel.price.toStringAsFixed(2)}',
                color: CoffeeColors().textBlack,
                size: 14,
                isBold: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
