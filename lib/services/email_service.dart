import 'package:dio/dio.dart';

class EmailService {

  Future<int> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {

    final url = "https://api.emailjs.com/api/v1.0/email/send";

    final data = {
      "service_id": "service_2pq7bhd",
      "template_id": "template_bca0tbe",
      "user_id": "X5MT3ODMXfGFPaWJD",
      "template_params": {
        "name": name,
        "email": email,
        "message": message,
      }
    };

    final response = await Dio().post(
      url,
      data: data,
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
    );

    return response.statusCode!;
  }
}