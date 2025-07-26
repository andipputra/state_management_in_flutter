import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:dio/dio.dart';

class DataRepository {
  final Dio dio;

  DataRepository({required this.dio});

  Future<List<ProvinceResponse>> fetchProvinces() async {
    try {
      final response = await dio.get('/provinces');
      if (response.statusCode == 200 && response.data is List) {
        final data = response.data as List;
        return data
            .map(
              (item) => ProvinceResponse.fromJson(item as Map<String, dynamic>),
            )
            .toList();
      }
      throw Exception('Failed to load provinces');
    } catch (e) {
      throw Exception('Error fetching provinces: $e');
    }
  }
}
