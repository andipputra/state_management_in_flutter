import 'package:get/get.dart';

class HomeController extends GetxController {
  final counter = 0.obs;
  final counterInt = RxInt(0);
  final counterString = ''.obs;
  final counterNullableString = Rxn<String>(null);

  void increment() {
    counter.value++;
    counterString.value = 'PENAMBAHAN';
  }
}
