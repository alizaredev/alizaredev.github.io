import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/services/email_service.dart';

class ContactController extends GetxController {
  final EmailService emailService = EmailService();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  Future<void> sendEmail(String name, String email, String message) async {
    emailService.sendEmail(
      name: name, 
      email: email, 
      message: message
    );
  }
}