import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List items = [].obs;
  RxBool isLoading = false.obs;
  @override
  void onReady() {
    // TODO: implement onReady
    allData();
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    allData();

    super.onInit();
  }

  Future<void> allData() async {
    isLoading.value = false;
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    final uri = Uri.parse(url);
    final resp = await http.get(uri, headers: {'accept': 'application/json'});
    if (resp.statusCode == 200) {
      final json = jsonDecode(resp.body) as Map;
      final result = json['items'] as List;
      items = result;
    }
    isLoading.value = true;
  }

  Future<void> deleteByID(String id) async {
    //menghapus item di server
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final resp =
        await http.delete(uri, headers: {'accept': 'application/json'});
    if (resp.statusCode == 200) {
      print("Berhasil menghapus");
      Get.back();
      Get.snackbar("Berhasil", "Data anda berhasil di hapus");
      allData();
    } else {
      Get.back();
      Get.snackbar("Gagal Menghapus", "Data anda gagal di hapus");
    }
    //menghapus item dari list
  }
}
