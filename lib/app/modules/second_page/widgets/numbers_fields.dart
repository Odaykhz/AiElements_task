import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/text_field_widget.dart';
import '../../first_page/controllers/first_page_controller.dart';
import '../controllers/second_page_controller.dart';

class NumbersFields extends GetView<SecondPageController> {
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
                "Number #${index + 1}",
                style: Get.textTheme.bodyText1,
              ),
              TextFieldWidget(
                controller: controller.controllers![index],
                hintText: "Enter any number here...",
                keyboardType: TextInputType.number,
                isFirst: false,
                isLast: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "This field is required".tr;
                  } else if (val
                      .contains(RegExp("[a-zA-Zا-ي?=*!@#\$%^&*()?{}|<>]"))) {
                    return 'should be contains numbers only'.tr;
                  } else {
                    return null;
                  }
                },
              ).paddingOnly(top: 8, bottom: 12),
            ],
          );
        });
  }
}
