part of 'province_cubit.dart';

@immutable
sealed class ProvinceState {}

final class ProvinceInitial extends ProvinceState {}

final class ProvinceLoading extends ProvinceState {}

final class ProvinceLoaded extends ProvinceState {
  final List<ProvinceResponse> provinces;

  ProvinceLoaded(this.provinces);
}

final class ProvinceError extends ProvinceState {
  final String message;

  ProvinceError(this.message);
}
