import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'province_provider.g.dart';

@riverpod
class Province extends _$Province {
  @override
  FutureOr<List<ProvinceResponse>> build() async {
    await fetchProvinces();

    final data = state.when(
      data: (data) => data,
      error: (error, stackTrace) => <ProvinceResponse>[],
      loading: () => <ProvinceResponse>[],
    );

    return data;
  }

  Future<void> fetchProvinces() async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(dataRepositoryProvider);
      final provinces = await repository.fetchProvinces();

      state = AsyncError('pengen error aja', StackTrace.current);

      await Future.delayed(const Duration(seconds: 2));

      state = AsyncData(provinces);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
