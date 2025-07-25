import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'province_state.dart';

class ProvinceCubit extends Cubit<ProvinceState> {
  ProvinceCubit({required this.dataRepository}) : super(ProvinceInitial());

  final DataRepository dataRepository;

  void loadProvinces() {
    emit(ProvinceLoading());
    dataRepository
        .fetchProvinces()
        .then((provinces) {
          emit(ProvinceLoaded(provinces));
        })
        .catchError((error) {
          emit(ProvinceError(error.toString()));
        });
  }
}
