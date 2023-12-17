import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/features/user_profile/presentation/views/widgets/list_tile.dart';
import 'package:grocery_app/features/user_profile/presentation/views/widgets/show_dialog.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

mixin UserScreenMixin {
  final TextEditingController _addressTextController =
      TextEditingController(text: '');
}

class _UserScreenState extends State<UserScreen> with UserScreenMixin {
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(15),
                top: ScreenUtil().setHeight(20),
              ),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Hi, ",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Guest",
                    style: TextStyle(
                      color:
                          themeState.getDarkTheme ? Colors.white : Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(15),
                top: ScreenUtil().setHeight(5),
              ),
              child: Text(
                'test@test.com',
                style: TextStyle(
                  color: themeState.getDarkTheme ? Colors.white : Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Divider(color: Colors.grey, thickness: 1),
            MyListTile(
              titleText: 'Address',
              icon: IconlyLight.profile,
              onTap: () async {
                await showAddressDialogMethod(context, _addressTextController);
              },
            ),
            MyListTile(
              titleText: 'Orders',
              icon: IconlyLight.wallet,
              onTap: () {},
            ),
            MyListTile(
              titleText: 'Wishlist',
              icon: IconlyLight.heart,
              onTap: () {},
            ),
            MyListTile(
              titleText: 'Viewed',
              icon: IconlyLight.show,
              onTap: () {},
            ),
            MyListTile(
              titleText: 'Forget Password',
              icon: IconlyLight.unlock,
              onTap: () {},
            ),
            SwitchListTile(
              thumbColor: MaterialStateProperty.all(Colors.white),
              secondary: themeState.getDarkTheme
                  ? const Icon(
                      Icons.dark_mode_outlined,
                    )
                  : const Icon(
                      Icons.light_mode_outlined,
                    ),
              title: Text(
                'Theme',
                style: TextStyle(
                  fontSize: 17.sp,
                ),
              ),
              value: themeState.getDarkTheme,
              onChanged: (value) {
                setState(() {
                  themeState.setDarkThemeProvider = value;
                });
              },
            ),
            MyListTile(
              titleText: 'Log out',
              icon: IconlyLight.logout,
              onTap: () async {
                await showLogOutDialogMethod(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
