import 'package:flutter/material.dart';
import 'package:grocery_app/features/cart/presentation/views/cart_screen.dart';
import 'package:grocery_app/features/categories/presentation/views/categories_screen.dart';
import 'package:grocery_app/features/home/presentation/views/home_screen.dart';
import 'package:grocery_app/features/user_profile/presentation/views/user_screen.dart';
import 'package:iconly/iconly.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> screens = [
      {
        'Page': const HomeScreen(),
        'Title': 'Home Screen',
      },
      {
        'Page': const CategoriesScreen(),
        'Title': 'Categories Screen',
      },
      {
        'Page': const CartScreen(),
        'Title': 'Cart Screen',
      },
      {
        'Page': const UserScreen(),
        'Title': 'User Screen',
      },
    ];

    void selectedPage(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      /*  appBar: AppBar(
        elevation: 0.0,
        backgroundColor: isDark ? Colors.blue.withOpacity(0) : Colors.blue,
        title: Text(
          '${screens[selectedIndex]['Title']}',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ), */
      body: screens[selectedIndex]['Page'],
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
        currentIndex: selectedIndex,
        onTap: selectedPage,
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
