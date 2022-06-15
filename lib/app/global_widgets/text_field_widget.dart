import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../common/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      this.onSaved,
      this.validator,
      this.keyboardType,
      this.initialValue,
      this.hintText,
      this.iconData,
      this.labelText,
      this.obscureText,
      this.suffixIcon,
      this.isFirst,
      this.isLast,
      this.style,
      this.textAlign,
      this.onChanged,
      this.borderRadius,
      this.controller,
      this.isRaduis,
      this.maxLengthEnforced,
      this.maxLength,
      this.maxLines,
      this.inputFormatters})
      : super(key: key);
  final int? maxLines;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool? obscureText;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final FormFieldSetter? onChanged;
  final BorderRadius? borderRadius;
  final bool? isRaduis;
  final bool? maxLengthEnforced;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  //
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: const [],
          style: style ?? Get.theme.textTheme.bodyText2,
          obscureText: obscureText ?? false,
          textAlign: textAlign ?? TextAlign.start,
          cursorColor: Colors.black87,
          decoration: InputDecoration(
            filled: true, //<-- SEE HERE
            fillColor: AppColors.lightGrey.withOpacity(0.4),
            hintText: hintText,
            helperStyle: Get.textTheme.caption,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: AppColors.lightGrey.withOpacity(0.4), width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: AppColors.lightGrey.withOpacity(0.4), width: 0.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: AppColors.lightGrey.withOpacity(0.4), width: 0.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: AppColors.lightGrey.withOpacity(0.4), width: 0.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: AppColors.lightGrey.withOpacity(0.4), width: 0.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: AppColors.lightGrey.withOpacity(0.4), width: 0.0),
            ),
          ),
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
        ),
      ],
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst != null && isFirst!) {
      return BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast != null && isLast!) {
      return BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (isFirst != null && !isFirst! && isLast != null && !isLast!) {
      return BorderRadius.all(Radius.circular(10));
    }

    // if(isRaduis==true)
    //   return  BorderRadius.all(Radius.circular(10));
    // else if(isRaduis ==false )
    //   return  BorderRadius.all(Radius.circular(0));

    return BorderRadius.all(Radius.circular(0));
  }

  double get topMargin {
    if ((isFirst != null && isFirst!)) {
      return 0;
    } else if (isFirst == null) {
      return 0;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast!)) {
      return 10;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }

  static InputDecoration getInputDecoration(
      {String hintText = '',
      IconData? iconData,
      Widget? suffixIcon,
      String counterText = ''}) {
    return InputDecoration(
      counterText: counterText,
      hintText: hintText,
      errorMaxLines: 3,
      hintStyle: Get.textTheme.caption,
      prefixIcon: iconData != null
          ? Icon(iconData, color: Get.theme.focusColor).marginOnly(right: 14)
          : SizedBox(),
      prefixIconConstraints: iconData != null
          ? BoxConstraints.expand(width: 38, height: 38)
          : BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.all(0),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
    );
  }
}
