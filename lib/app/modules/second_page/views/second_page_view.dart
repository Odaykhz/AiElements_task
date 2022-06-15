import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/responses.dart';
import '../../../common/app_colors.dart';
import '../../../global_widgets/circular_block_button_widget.dart';
import '../../first_page/controllers/first_page_controller.dart';
import '../../third_page/controllers/third_page_controller.dart';
import '../../third_page/views/third_page_view.dart';
import '../controllers/second_page_controller.dart';
import '../widgets/date_fields.dart';
import '../widgets/numbers_fields.dart';
import '../widgets/text_fields.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class SecondPageView extends GetView<SecondPageController> {
  final FirstPageController _firstController = Get.put(FirstPageController());
  final ThirdPageController _thirdController = Get.put(ThirdPageController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => keyboardDisable(context)),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: appBar(),
          body: Form(
            key: controller.secondPageForm,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    _firstController.selectedType == "Text"
                        ? TextFields()
                        : _firstController.selectedType == "Numbers"
                            ? NumbersFields()
                            : DateFields(),
                    saveButton()
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
      automaticallyImplyLeading: false,
      title: const Text('Second Page'),
    );
  }

  saveButton() {
    return SizedBox(
      width: Get.width * 0.85,
      child: CircularBlockButtonWidget(
        color: AppColors.colorStartedTitle,
        text: Text(
          "Save",
          style: Get.textTheme.bodyText2!
              .copyWith(fontSize: 20, color: AppColors.primaryColor),
        ),
        onPressed: () {
          if (controller.secondPageForm.currentState!.validate()) {
            // initiate a local storage
            GetStorage box = GetStorage();

            var localResponses = box.read('responses') ?? [];

            controller.responses = List<Responses>.from(json
                .decode(json.encode(localResponses))
                .map((x) => Responses.fromJson(x)));

            Responses response =
                Responses(dataType: _firstController.selectedType, fields: []);

            controller.controllers!.forEach((element) {
              response.fields!.add(Fields(value: element.text));
            });

            controller.responses.add(response);

            List list = [];

            controller.responses.forEach((element) {
              list.add(element.toJson());
            });

            box.write('responses', list);

            Get.to(() => ThirdPageView());
          }
        },
      ),
    );
  }
}
