/*
* Created by Neloy on 20 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';

class CustomAppbar {
  static primary() {
    return AppBar(
      title: Text(AppText.gainSolutions),
      actions: [
        Stack(
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: Icon(Icons.notifications_none_outlined),
            ),

            Positioned(
              top: 3,
              right: 6,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColor.colorNotification,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ),
          ],
        ),
        AppSize.gapW20,
      ],
    );
  }

  static filter({required BuildContext context}) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close),
      ),
      leadingWidth: 30,

      title: Text(
        AppText.filter,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  static profile() {
    return AppBar(
      title: Text(AppText.myProfile),
    );
  }
}
