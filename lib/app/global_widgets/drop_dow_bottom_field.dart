import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../common/app_colors.dart';

class DropDownBottonField extends StatelessWidget {
  const DropDownBottonField(
      {Key? key, this.value, this.items, this.onChanged, this.validator})
      : super(key: key);
  final String? value;
  final List<DropdownMenuItem<String>>? items;
  final String? Function(Object?)? validator;
  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        key: key,
        items: items,
        validator: validator,
        onChanged: onChanged,
        value: value,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.lightGrey.withOpacity(0.4),
            hintText: "Please choose your data type",
            helperStyle: Get.textTheme.caption,
            border: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            errorBorder: outlineInputBorder(),
            enabledBorder: outlineInputBorder(),
            focusedErrorBorder: outlineInputBorder(),
            disabledBorder: outlineInputBorder()));
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide:
          BorderSide(color: AppColors.lightGrey.withOpacity(0.4), width: 0.0),
    );
  }
}
