import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/first_page/bindings/first_page_binding.dart';
import 'app/modules/first_page/views/first_page_view.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  GetStorage box = GetStorage();
  box.erase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: FirstPageBinding(),
      home: FirstPageView(),
      getPages: AppPages.pages,
    );
  }
}
