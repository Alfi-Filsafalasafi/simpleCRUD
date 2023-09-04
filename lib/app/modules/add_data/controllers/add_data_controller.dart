import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddDataController extends GetxController {
  TextEditingController titleC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    print("hallo");
    super.onInit();
    // allData();
  }

  void submit() async {
    //ambil data dari form
    final title = titleC.text;
    final desc = descriptionC.text;

    //submit data ke server
    final body = {
      "title": title,
      "description": desc,
      "is_completed": "false",
    };
    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final resp = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json'
      }, //header itu opsional kalo misal tidak bisa
    );

    //validasi berhasil atau tidak
    if (resp.statusCode == 201) {
      Get.snackbar("Berhasil", "Data anda tersimpan");

      print(resp.body);
    } else {
      Get.snackbar("Gagal", "Data anda gagal tersimpan");
    }

    // print(resp.body);
    // print(resp.statusCode);
  }
}
