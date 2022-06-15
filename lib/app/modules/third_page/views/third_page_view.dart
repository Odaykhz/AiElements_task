import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/app_colors.dart';
import '../../../global_widgets/circular_block_button_widget.dart';
import '../../first_page/controllers/first_page_controller.dart';
import '../../first_page/views/first_page_view.dart';
import '../../second_page/controllers/second_page_controller.dart';
import '../controllers/third_page_controller.dart';

class ThirdPageView extends GetView<ThirdPageController> {
  final SecondPageController _secondController =
      Get.put(SecondPageController());
  final FirstPageController _firstController = Get.put(FirstPageController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: appBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: ListView.builder(
                itemCount: _secondController.responses.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 1,
                          );
                        },
                        shrinkWrap: true,
                        itemCount:
                            _secondController.responses[index].fields!.length,
                        itemBuilder: ((context, secondIndex) {
                          return Center(
                              child: Text(_secondController.responses[index]
                                      .fields![secondIndex].value!)
                                  .paddingSymmetric(vertical: 10));
                        })),
                  ).paddingSymmetric(vertical: 10);
                }),
          )),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.colorStartedTitle,
      title: const Text('Third Page'),
      actions: [
        CircularBlockButtonWidget(
            color: AppColors.primaryColor,
            text: Text(
              "new form",
              style: Get.textTheme.bodyText1,
            ),
            onPressed: () {
              Get.offAll(() => FirstPageView());
              _firstController.numOfField.clear();
              _firstController.selectedType = null;
            }).paddingSymmetric(horizontal: 10, vertical: 5)
      ],
    );
  }
}
