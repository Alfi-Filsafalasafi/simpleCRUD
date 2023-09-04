import 'package:coba_versi_372/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  AddDataView({Key? key}) : super(key: key);
  final homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddDataView'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.titleC,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: controller.descriptionC,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              minLines: 5,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.submit();
                  Get.back();
                  homeC.allData();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("Submit"),
                ))
          ],
        ));
  }
}
