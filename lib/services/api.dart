import 'dart:convert';

import 'package:employee_app/models/responseAuth.dart';
import 'package:employee_app/services/sharedprefs.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/response.dart';
import 'apiurl.dart';
import 'package:http/http.dart' as http;

class Api {
  static const url = Base_uri;

  static Future<Response> getData() async {
    Uri endpoint = Uri.parse("$url");
    var response = await http.get(endpoint);
    print(response.body.toString());
    return responseFromJson(response.body);
  }
  static Future<void> loginUser(User user) async {
    Uri endpoint = Uri.parse("$url/user");
    Map body = {
      "name": user.displayName ?? 'Hello',
      "email": user.email,
      "firebaseUid": user.uid
    };
    var response =
        await http.post(endpoint, body: jsonDecode(jsonEncode(body)));
    ResponseAuth responseAuth = responseAuthFromJson(response.body);
    LocalSharedPreference.setToken(responseAuth.token);
    return;
  }
}
