import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/contact_controller.dart';
import 'text_from_field_widget.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final ContactController contactController = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contactController.formKey,
      child: Column(
        spacing: 20,
        children: [
          TextFormFieldWidget(
            controller: nameController,
            label: "Name",
            validator: (name) {
              if (name == null || name.isEmpty) {
                return "Enter Your Name...";
              }
              return null;
            },
          ),

          TextFormFieldWidget(
            controller: emailController,
            label: "Email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Your Email...";
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return "Invalid email";
              }
              return null;
            },
          ),

          TextFormFieldWidget(
            controller: messageController,
            label: "Message...",
            minLines: 4,
            maxLines: 4,
            validator: (message) {
              if (message == null || message.isEmpty) {
                return "Enter Your Message...";
              }
              return null;
            },
          ),

          Obx(
            () => SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 24,
                children: [
                  contactController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (contactController.formKey.currentState!.validate()) {
                          contactController.sendEmail(
                            nameController.text, 
                            emailController.text, 
                            messageController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        foregroundColor: Colors.black,
                      ),
                      child: Text("Get In Touch"),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFB84D1D),
                          Color(0xFF8A1F5A),
                          Color(0xFF5B247A),
                          Color(0xFF2C2E91),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: IconButton.filled(
                      onPressed: () async{
                        await launchUrl(Uri.parse("https://instagram.com/alizare.code"));
                      }, 
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent
                      ),
                      icon: FaIcon(FontAwesomeIcons.instagram)
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF2B6F89),
                          Color(0xFF1B5A72),
                          Color(0xFF0F4157),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: IconButton.filled(
                      onPressed: () async{
                        await launchUrl(Uri.parse("https://t.me/alizzar"));
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent
                      ),
                      icon: FaIcon(FontAwesomeIcons.telegram),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF004C75),
                          Color(0xFF006D8E),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: IconButton.filled(
                      onPressed: () async{
                        await launchUrl(Uri.parse("https://www.linkedin.com/in/alizare-code"));
                      }, 
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent
                      ),
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
