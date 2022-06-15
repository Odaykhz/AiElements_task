import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/app_colors.dart';
import '../../../global_widgets/circular_block_button_widget.dart';
import '../../../global_widgets/drop_dow_bottom_field.dart';
import '../../../global_widgets/text_field_widget.dart';
import '../../second_page/controllers/second_page_controller.dart';
import '../../second_page/views/second_page_view.dart';
import '../controllers/first_page_controller.dart';

class FirstPageView extends GetView<FirstPageController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => keyboardDisable(context),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar(),
        body: Form(
          key: controller.firstPageForm,
          child: Container(
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    numberOfFields(),
                    dataType(),
                    nextButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void keyboardDisable(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: AppColors.colorStartedTitle,
      title: const Text('First Page'),
    );
  }

  numberOfFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Number of Fields",
          style: Get.textTheme.bodyText1,
        ).paddingOnly(bottom: 12),
        TextFieldWidget(
          controller: controller.numOfField,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          hintText: "Please enter number of fields",
          isFirst: false,
          isLast: false,
          maxLength: 2,
          validator: (val) {
            var count = int.tryParse(controller.numOfField.text);
            if (val!.startsWith("0")) {
              return "Number of fields cannot be less than one";
            } else if (val.isEmpty) {
              return "This field is required".tr;
            } else if (val
                .contains(RegExp("[a-zA-Zا-ي?=*!@#\$%^&*()?{}|<>]"))) {
              return 'should be contains numbers only'.tr;
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  dataType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Data Type",
          style: Get.textTheme.bodyText1,
        ).paddingOnly(top: 10, bottom: 12),
        DropDownBottonField(
          items: controller.dataTypes.map((e) {
            return DropdownMenuItem<String>(
                value: e,
                child: Row(
                  children: <Widget>[
                    Text(
                      e,
                      style: Get.theme.textTheme.bodyText2,
                    ),
                  ],
                ));
          }).toList(),
          validator: (val) {
            if (val == null) {
              return "This field is required";
            } else {
              return null;
            }
          },
          onChanged: (dynamic newValue) {
            controller.selectedType = newValue;
          },
          value: controller.selectedType,
        ).paddingOnly(bottom: 50),
      ],
    );
  }

  nextButton() {
    return Center(
      child: SizedBox(
        width: Get.width,
        child: CircularBlockButtonWidget(
            color: AppColors.colorStartedTitle,
            text: Text(
              "Next",
              style: Get.textTheme.bodyText2!
                  .copyWith(fontSize: 20, color: AppColors.primaryColor),
            ),
            onPressed: () async {
              if (controller.firstPageForm.currentState!.validate()) {
                Get.lazyPut(() => SecondPageController());
                await Get.to(() => SecondPageView());
                controller.numOfField.clear();
                controller.selectedType = null;
              }
            }),
      ),
    );
  }
}
