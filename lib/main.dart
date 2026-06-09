import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/contact_controller.dart';
import 'package:portfolio/views/screens/home_screen.dart';

void main(List<String> args) {
  Get.put(ContactController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}