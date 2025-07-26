import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:get/get.dart';

class ProvinceController extends GetxController {
  final isLoading = false.obs;
  final provinceData = <ProvinceResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProvinceData();
  }

  Future<void> getProvinceData() async {
    try {
      isLoading.value = true;
      final repository = Get.find<DataRepository>();
      final data = await repository.fetchProvinces();
      provinceData.assignAll(data);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load provinces: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
