import 'package:covid_19_worldwide/controllers/bindings/controller_bindings.dart';
import 'package:covid_19_worldwide/views/detail_country_view.dart';
import 'package:covid_19_worldwide/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeView(),
          binding: ControllerBindings(),
        ),
        GetPage(
          name: '/detail',
          page: () => DetailCountryView(),
          binding: ControllerBindings(),
        ),
      ],
      theme: ThemeData.dark(),
    );
  }
  //
}
