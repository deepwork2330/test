import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/config.dart';

class ApiClient {
  // Post Method
  static Future post(Map<String, dynamic> param, url, {header}) async {
    var response = await http.post(Uri.parse("${Config.BASE_URL}$url"),
        body: param, headers: header);
    log("statusCode ====> ${response.statusCode}");
    log("param ====> $param");
    log("header ====> $header");
    log("body ====> ${response.body}");

    if (response.statusCode == 200) {
      print('***********----------------200');

      var data = json.decode(response.body);
      if (data["message"] == "Login successfully." ||
          data["message"] ==
              "Register successfully. Please activate your email address.") {
        showColoredSnakeBar(Get.context!,
            color: Colors.green, msg: data["message"]);
      } else if (data["message"] == "Email and password is wrong.") {
        var data = json.decode(response.body);
        showColoredSnakeBar(Get.context!,
            color: Colors.red, msg: data["message"]);
      }
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      print('***********----------------401');

      var data = json.decode(response.body);
      showColoredSnakeBar(Get.context!,
          color: Colors.red, msg: data["message"]);
      Get.offAllNamed("/login");
    } else if (response.statusCode == 302) {
      print('***********----------------302');
      // var data = json.decode(response.body);
      showColoredSnakeBar(Get.context!, color: Colors.red, msg: 'Server error');
    } else {
      var data = json.decode(response.body);
      showColoredSnakeBar(Get.context!,
          color: Colors.red, msg: data["message"]);
    }
  }

//Get Method
  static Future get(url, {header}) async {
    var response = await http.get(Uri.parse("${Config.BASE_URL}$url"),
        headers: await header);
    log("url ====> ${Config.BASE_URL}$url");
    log("statusCode ====> ${response.statusCode}");
    log("header ====> ${await header}");
    log("body ====> ${response.body}");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      var data = json.decode(response.body);
      showColoredSnakeBar(Get.context!,
          color: Colors.red, msg: data["message"]);
      Get.offAllNamed("/login");
    } else {
      var data = json.decode(response.body);
      showColoredSnakeBar(Get.context!,
          color: Colors.red, msg: data["message"]);
    }
  }
}

showColoredSnakeBar(BuildContext con,
    {String? msg, Color? color, SnackBarBehavior? behavior}) {
  ScaffoldMessenger.of(con).showSnackBar(
    SnackBar(
      behavior: behavior ?? SnackBarBehavior.floating,
      content: Text(
        msg ?? '',
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    ),
  );
}
