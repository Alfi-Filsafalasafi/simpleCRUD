import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coba_controller.dart';

class CobaView extends GetView<CobaController> {
  const CobaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CobaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CobaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
