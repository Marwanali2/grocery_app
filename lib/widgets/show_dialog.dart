import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

Future<dynamic> showAddressDialogMethod(
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
            if (kDebugMode) {
              print('***********${_addressTextController.text}');
            }
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

Future<dynamic> showLogOutDialogMethod(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            //Icon(IconlyBroken.logout),
            Image.asset(
              'assets/images/warning-sign.png',
              height: 30,
            ),
            const Text(' Sign Out'),
          ],
        ),
        content: const Text('Do You Want To Sign Out?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
