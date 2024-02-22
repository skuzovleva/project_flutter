import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeText extends StatelessWidget {
  const CoffeeText({
    super.key,
    required this.text,
    required this.size,
    required this.isBold,
    required this.color,
    this.textAlign = TextAlign.center,
  });

  final String text;
  final double size;
  final bool isBold;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: GoogleFonts.sora(
        fontSize: size,
        fontWeight: (isBold ? FontWeight.w600 : FontWeight.normal),
        color: color,
      ),
    );
  }
}

class MiniButton extends StatefulWidget {
  const MiniButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});

  final String icon, text;
  final void Function() onPressed;

  @override
  State<MiniButton> createState() => _MiniButtonState();
}

class _MiniButtonState extends State<MiniButton> {
  Color textColor = CoffeeColors().textBlack;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        left: 3,
        right: 3,
      ),
      height: screenSize.height * 0.07,
      width: screenSize.width * 0.32,
      child: ElevatedButton(
        onPressed: () {},
        onHover: (isHovered) {
          setState(() {
            textColor = isHovered ? Colors.white : CoffeeColors().textBlack;
          });
        },
        style: ButtonStyle(
          surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.white),
          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          elevation: const MaterialStatePropertyAll<double>(0),
          overlayColor:
              MaterialStatePropertyAll<Color?>(CoffeeColors().myBrown),
          alignment: Alignment.center,
          iconColor: MaterialStatePropertyAll<Color>(textColor),
          iconSize: const MaterialStatePropertyAll<double>(18),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(
                width: 1,
                color: CoffeeColors().greyBorder,
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(widget.icon),
            ),
            const SizedBox(
              width: 7,
            ),
            CoffeeText(
              text: widget.text,
              size: 10,
              isBold: false,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}

class CashBottomNavigation extends StatelessWidget {
  const CashBottomNavigation({super.key, required this.cash});

  final String cash;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.3,
      height: screenSize.height * 0.03,
      decoration: BoxDecoration(
        color: CoffeeColors().myGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenSize.width * 0.136,
            height: screenSize.height * 0.03,
            decoration: BoxDecoration(
              color: CoffeeColors().myBrown,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'Cash',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: screenSize.width * 0.164,
            height: screenSize.height * 0.03,
            decoration: BoxDecoration(
              color: CoffeeColors().myGrey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '\$ $cash',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CoffeeButton extends StatelessWidget {
  const CoffeeButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width = 15});

  final String text;
  final void Function() onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: width == 15 ? screenSize.width * 0.85 : width,
      height: screenSize.height * 0.076,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(CoffeeColors().myBrown),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          overlayColor: const MaterialStatePropertyAll(Colors.brown),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: CoffeeText(
          text: text,
          size: 16,
          isBold: true,
          color: Colors.white,
        ),
      ),
    );
  }
}
