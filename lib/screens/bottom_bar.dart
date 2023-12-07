import 'package:flutter/material.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/user_screen.dart';
import 'package:iconly/iconly.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  static int _selectedIndex = 0;
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    List _screens = [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      const UserScreen(),
    ];
    void _selectedPage(int index) {
      setState(() {
        BottomBar._selectedIndex = index;
      });
    }

    return Scaffold(
      body: _screens[BottomBar._selectedIndex],
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.vertical,
          // barStyle: BubbleBarStyle.vertical,
          bubbleFillStyle: BubbleFillStyle.fill,
          inkEffect: true,
          unselectedIconColor: Colors.grey,
          // bubbleFillStyle: BubbleFillStyle.outlined,
          opacity: 0.3,
        ),
        currentIndex: BottomBar._selectedIndex,
        onTap: _selectedPage,
        items: [
          BottomBarItem(
            icon: const Icon(IconlyBroken.home),
            title: const Text('Home'),
            backgroundColor: Colors.blue,
            selectedIcon: const Icon(IconlyBold.home),
          ),
          BottomBarItem(
            icon: const Icon(IconlyBroken.category),
            selectedIcon: const Icon(IconlyBold.category),
            title: const Text('Categories'),
            backgroundColor: Colors.orange,
          ),
          BottomBarItem(
            icon: const Icon(IconlyBroken.buy),
            selectedIcon: const Icon(IconlyBold.buy),
            title: const Text('Cart'),
            backgroundColor: Colors.green,
          ),
          BottomBarItem(
            icon: const Icon(IconlyBroken.user_2),
            selectedIcon: const Icon(IconlyBold.user_2),
            title: const Text('User'),
            backgroundColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
