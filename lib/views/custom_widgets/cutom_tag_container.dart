/*
* Created by Neloy on 20 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_font.dart';
import 'package:gsl_task/utilities/app_size.dart';

class CustomTagContainer {
  static primary({
    required BuildContext context,
    required String status,
    bool active = false,
    Color activeColor = AppColor.colorActiveLow,
  }) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.colorBorder, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            active
                ? Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeColor,
                  ),
                )
                : AppSize.noGap,
            active ? AppSize.gapW10 : AppSize.noGap,

            Text(
              status,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontFamily: AppFont.font500),
            ),
          ],
        ),
      ),
    );
  }

  static status({
    required BuildContext context,
    required String status,
    required Color statusTextColor,
    required Color statusBackgroundColor,
  }) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: statusBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          status,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: statusTextColor),
        ),
      ),
    );
  }
}
