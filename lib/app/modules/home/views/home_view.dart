import 'package:coba_versi_372/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Visibility(
          visible: controller.isLoading.value,
          replacement: Center(child: CircularProgressIndicator()),
          child: RefreshIndicator(
            onRefresh: controller.allData,
            child: ListView.builder(
              itemCount:
                  controller.items.length == 0 ? 1 : controller.items.length,
              itemBuilder: (context, index) {
                if (controller.items.length == 0) {
                  return Container(
                    height: Get.height * 0.8,
                    child: Center(child: Text('Tidak ada Data')),
                  );
                } else {
                  final item = controller.items[index] as Map;
                  final id = item['_id'];
                  return ListTile(
                    onTap: () => Get.toNamed(Routes.EDIT_DATA),
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(item['title']),
                    subtitle: Text(item['description']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Membatasi lebar Row sesuai dengan ikon
                      children: [
                        GestureDetector(
                            onTap: () =>
                                Get.toNamed(Routes.EDIT_DATA, arguments: item),
                            child: Icon(Icons.edit)), // Ikon pensil
                        SizedBox(width: 8), // Spasi antara ikon
                        GestureDetector(
                          onTap: () => Get.defaultDialog(
                              title: "Konfirmasi",
                              content: Text(
                                "Apakah anda yakin menghapus item ini ?",
                                textAlign: TextAlign.center,
                              ),
                              contentPadding: EdgeInsets.all(10),
                              confirm: ElevatedButton(
                                  onPressed: () async {
                                    controller.deleteByID(id);
                                  },
                                  child: Text("Ya"))),
                          child: Icon(
                            Icons.delete,
                          ),
                        ), // Ikon hapus
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_DATA),
          child: Icon(Icons.add)),
    );
  }
}
