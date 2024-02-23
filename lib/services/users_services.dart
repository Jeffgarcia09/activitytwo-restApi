import 'dart:convert';

import 'package:activitytwo/model/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUserData() async {
  // final response = await http.get(Uri.parse('http://10.0.2.2:3000/users'));
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/users'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => User.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load user data');
  }
}
