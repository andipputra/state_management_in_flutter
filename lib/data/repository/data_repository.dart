import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:get/get.dart';

class DataRepository extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://open-api.my.id/api/wilayah';
    httpClient.addRequestModifier<dynamic>((request) {
      Get.log('Request => Method: ${request.method}');
      Get.log('Request => URL: ${request.url}');
      Get.log('Request => Headers: ${request.headers}');
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      Get.log('Response => Status Code: ${response.statusCode}');
      Get.log('Response => Data: ${response.body}');
      return response;
    });
  }

  Future<List<ProvinceResponse>> fetchProvinces() async {
    final response = await get('/provinces');
    if (response.isOk && response.body is List) {
      final data = response.body as List;
      return data
          .map(
            (item) => ProvinceResponse.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    }
    throw Exception('Failed to load provinces');
  }
}
