import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:day_21_state_management/presentation/controllers/province_controller/province_controller.dart';
import 'package:get/get.dart';

class ProvinceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataRepository());
    Get.lazyPut(() => ProvinceController());
  }
}
