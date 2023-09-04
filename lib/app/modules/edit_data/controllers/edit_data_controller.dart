import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditDataController extends GetxController {
  //TODO: Implement EditDataController
  TextEditingController titleC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  String? idData;
  final item = Get.arguments as Map<String, dynamic>;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    titleC.text = item['title'];
    descriptionC.text = item['description'];
    idData = item['_id'];
  }

  void updateData(String id) async {
    //ambil data dari form
    final title = titleC.text;
    final desc = descriptionC.text;

    //submit data ke server
    final body = {
      "title": title,
      "description": desc,
      "is_completed": "false",
    };
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final resp = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json'
      }, //header itu opsional kalo misal tidak bisa
    );

    //validasi berhasil atau tidak
    if (resp.statusCode == 200) {
      Get.snackbar("Berhasil", "Data anda berhasil di update");

      print(resp.body);
    } else {
      Get.snackbar("Gagal", "Data anda gagal tersimpan");
    }

    // print(resp.body);
    // print(resp.statusCode);
  }
}
