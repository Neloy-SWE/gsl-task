/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_size.dart';

class CustomTextField{
  static search({
    required BuildContext context,
    required String hint,
    FormFieldValidator<String>? validatorFunction,
    required TextEditingController controller,
    required TextInputType textInputType,
    required TextInputAction textInputAction,
    void Function(String)? onFieldSubmitted,
    void Function(String)? onChanged,
    IconData? prefix,
    void Function()? prefixOnTap,
}){
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
      validator: validatorFunction,
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Colors.black38,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.colorSearchFieldBackground,
        errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColor.colorNotification,
        ),
        contentPadding: AppSize.paddingAll10,
        alignLabelWithHint: true,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
        prefixIcon: InkWell(
          onTap: prefixOnTap,
          child: Icon(
            prefix,
            color: AppColor.colorTextTitle,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(28),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: AppColor.colorNotification),
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    );
  }
}