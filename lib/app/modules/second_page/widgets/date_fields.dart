import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_date_picker/platform_date_picker.dart';

import '../../../global_widgets/text_field_widget.dart';
import '../../first_page/controllers/first_page_controller.dart';
import '../controllers/second_page_controller.dart';

class DateFields extends GetView<SecondPageController> {
  @override
  Widget build(BuildContext context) {
    final FirstPageController _firstController = Get.put(FirstPageController());
    int fieldCount = int.parse(_firstController.numOfField.text);
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: fieldCount,
        itemBuilder: (context, index) {
          controller.controllers?.add(TextEditingController());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date #${index + 1}",
                style: Get.textTheme.bodyText1,
              ),
              InkWell(
                child: IgnorePointer(
                  ignoring: true,
                  child: TextFieldWidget(
                    controller: controller.controllers![index],
                    hintText: "Select any date".tr,
                    iconData: Icons.date_range,
                    isFirst: false,
                    isLast: false,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "This field is required".tr;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                onTap: () async {
                  DateTime? temp = await showPlatformDatePicker(
                    context: context,
                    firstDate: DateTime(DateTime.now().year - 50),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 50),
                  );
                  if (temp != null) {
                    controller.controllers![index].text =
                        "${temp.year}/${temp.month}/${temp.day}";
                  }
                },
              ).paddingOnly(top: 8, bottom: 12),
            ],
          );
        });
  }
}
