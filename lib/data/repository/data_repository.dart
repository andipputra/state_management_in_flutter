import 'package:day_21_state_management/core/connection/connection.dart';
import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_repository.g.dart';

@riverpod
DataRepository dataRepository (Ref ref) {
  return DataRepository(dio: ref.read(dioProvider));
}

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
