import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.icon,
    required this.titleText,
    required this.onTap,
  });

  final IconData icon;
  final String titleText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: Colors.grey,
      leading: Icon(
        icon,
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontSize: 17.sp,
        ),
      ),
      trailing: const Icon(
        IconlyBroken.arrow_right_2,
      ),
      onTap: onTap,
    );
  }
}
