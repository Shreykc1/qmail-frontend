import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class LocalController extends GetxController{
  static LocalController get instance => Get.find();
  var verificationid = ''.obs;

  Future<void> addUser(String email, String password) async {
    final String apiUrl = 'https://mail.mithibaitechspark.in/admin/mail/users/add';
    final String adminEmail = email;
    final String adminPassword = password;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$adminEmail:$adminPassword'))}',
        },
      );

      if (response.statusCode == 200) {
        // Successful user addition
        final responseData = json.decode(response.body);
        print('User added successfully: $responseData');
      } else {
        // Failed user addition
        print('Failed to add user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during user addition: $error');
    }
  }
  Future<void> loginUser(String email, String password, String text) async {
    final String apiUrl = 'https://mail.mithibaitechspark.in/admin/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$email:$password'))}',
        },
      );

      if (response.statusCode == 200) {
        // Successful login
        final responseData = json.decode(response.body);
        print('Login successful: $responseData');
      } else {
        // Failed login
        print('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during login:$error');
    }
  }
}