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

Future<dynamic> showDialogMethod(
    BuildContext context, TextEditingController _addressTextController) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Update Address'),
        content: TextFormField(
          controller: _addressTextController,
          onChanged: (value) {
            //_addressTextController.text = value;
            print('***********${_addressTextController.text}');
          },
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Enter Your Address',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Update',
            ),
          )
        ],
      );

      /* // another way
                  return Dialog(
                    elevation: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: ScreenUtil().setWidth(140),
                              top: ScreenUtil().setHeight(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Update Address',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Enter Your Address',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  );
              */
    },
  );
}
