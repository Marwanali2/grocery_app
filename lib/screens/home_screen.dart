import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Center(
      child: SwitchListTile(
        thumbColor: MaterialStateProperty.all(Colors.white),
        secondary: themeState.getDarkTheme
            ? const Icon(
                Icons.dark_mode_outlined,
              )
            : const Icon(
                Icons.light_mode_outlined,
              ),
        title: const Text('Theme'),
        value: themeState.getDarkTheme,
        onChanged: (value) {
          setState(() {
            themeState.setDarkThemeProvider = value;
          });
        },
      ),
    );
  }
}
