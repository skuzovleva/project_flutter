import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar(
      {super.key, required this.updateParent, required this.selectedIcon});

  final void Function(int) updateParent;

  final int selectedIcon;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIconBar = widget.selectedIcon;
    return BottomNavigationBar(
      iconSize: 30,
      elevation: 0,
      currentIndex: selectedIconBar,
      backgroundColor: Colors.white,
      selectedItemColor: CoffeeColors().myBrown,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 10.0,
      unselectedFontSize: 8.0,
      showSelectedLabels: true,
      onTap: (val) {
        setState(() {
          selectedIconBar = val;
          widget.updateParent(val);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/Home.png'),
          ),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/Heart.png'),
          ),
          label: 'Favourite',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/ShoppingBag.png'),
          ),
          label: 'Orders',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/Notification.png'),
          ),
          label: 'Notifications',
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
