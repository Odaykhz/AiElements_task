import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Models/responses.dart';

class SecondPageController extends GetxController {
  final GlobalKey<FormState> secondPageForm = GlobalKey<FormState>();
  List<TextEditingController>? controllers = [];
  List<Responses> responses = [];
}
