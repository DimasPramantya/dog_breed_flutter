import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_responsi/pages/home/home_page.dart';
import 'package:latihan_responsi/widgets/dialogs.dart';

class ApiService{
  Future<void> login(String email, String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse('https://diabetless-api-a5ey42wesa-et.a.run.app/users/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final String token = responseBody['token'];
      await GetStorage().write('token', token);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      failedDialog(context, responseBody['message']);
    }
  }

  Future<Map<String, dynamic>> getMeals() async {
    final response = await http.get(Uri.parse('https://diabetless-api-ik6ucgm26a-et.a.run.app/meals'));
    var data = response.body;
    return jsonDecode(data);
  }

   Future<Map<String, dynamic>> getBreeds() async {
    final response = await http.get(Uri.parse('https://dogapi.dog/api/v2/breeds'));
    var data = response.body;
    return jsonDecode(data);
  }
}