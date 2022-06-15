import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPageController extends GetxController {
  final GlobalKey<FormState> firstPageForm = GlobalKey<FormState>();
  final TextEditingController numOfField = TextEditingController();
  List<String> dataTypes = ["Text", "Numbers", "Date"];
  String? selectedType;
}
