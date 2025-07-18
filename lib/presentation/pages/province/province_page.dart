import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:day_21_state_management/presentation/pages/province/widgets/province_list.dart';
import 'package:flutter/material.dart';

class ProvincePage extends StatefulWidget {
  const ProvincePage({super.key});

  @override
  State<ProvincePage> createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  bool isLoading = false;
  List<ProvinceResponse> provinceData = [];

  @override
  void initState() {
    super.initState();
    getProvinceData();
  }

  Future<void> getProvinceData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final repository = DataRepository();
      final data = await repository.fetchProvinces();

      provinceData
        ..clear()
        ..addAll(data);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load provinces: $e')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Province Page')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ProvinceList(provinceData: provinceData),
    );
  }
}
