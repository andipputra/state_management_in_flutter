import 'package:day_21_state_management/presentation/controllers/province_controller/province_controller.dart';
import 'package:day_21_state_management/presentation/pages/province/widgets/province_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProvincePage extends GetView<ProvinceController> {
  static const routeName = '/province';

  const ProvincePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Province Page')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.provinceData.isEmpty) {
          return const Center(child: Text('No provinces found'));
        }

        return ProvinceList(provinceData: controller.provinceData);
      }),
    );
  }
}
