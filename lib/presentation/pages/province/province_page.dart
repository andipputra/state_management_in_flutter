import 'package:day_21_state_management/presentation/pages/province/widgets/province_list.dart';
import 'package:day_21_state_management/presentation/provider/province_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProvincePage extends ConsumerWidget {
  const ProvincePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provinceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Province Page')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            Center(child: Text('Failed to load provinces: $err')),
        data: (_) => ProvinceList(),
      ),
    );
  }
}
