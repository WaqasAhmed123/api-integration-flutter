import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

getUsers() async {
  print("fecthing");
  var userdata = [];

  var baseUrl = "https://jsonplaceholder.typicode.com/users";
  print("fetched"); 
  var url = Uri.parse(baseUrl);
  var response = await http.get(url);
  var jsonResponse = jsonDecode(response.body);
  print(response);
  print(jsonResponse);
   for (var i in jsonResponse) {
    userdata.add(UserModel.fromMap(i));
  }

  return userdata;
}
