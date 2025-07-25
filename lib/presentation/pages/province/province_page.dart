import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:day_21_state_management/presentation/bloc/province_cubit/province_cubit.dart';
import 'package:day_21_state_management/presentation/pages/province/widgets/province_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvincePage extends StatelessWidget {
  const ProvincePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProvinceCubit(dataRepository: context.read<DataRepository>())
            ..loadProvinces(),
      child: const ProvinceView(),
    );
  }
}

class ProvinceView extends StatelessWidget {
  const ProvinceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Province Page')),
      body: BlocConsumer<ProvinceCubit, ProvinceState>(
        builder: (context, state) {
          return switch (state) {
            ProvinceLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProvinceLoaded(provinces: final provinces) => ProvinceList(
              provinceData: provinces,
            ),
            ProvinceError(message: final message) => Center(
              child: Text('Error: $message'),
            ),
            _ => const Center(child: Text('Unknown state')),
          };
        },
        listener: (context, state) {
          if (state is ProvinceError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
          }
        },
        listenWhen: (previous, current) => current is ProvinceError,
      ),
    );
  }
}
