import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:day_21_state_management/presentation/inherited_widget/province_inherited_widget.dart';
import 'package:day_21_state_management/presentation/pages/province/widgets/province_count.dart';
import 'package:day_21_state_management/presentation/pages/province/widgets/province_list.dart';
import 'package:flutter/material.dart';

class ProvincePage extends StatefulWidget {
  const ProvincePage({super.key, required this.child});
  final Widget child;

  @override
  State<ProvincePage> createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  bool _isLoading = false;
  final List<ProvinceResponse> _provinceData = [];

  @override
  void initState() {
    super.initState();
    _getProvinceData();
  }

  _getProvinceData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final repository = DataRepository();
      final data = await repository.fetchProvinces();

      setState(() {
        _provinceData.clear();
        _provinceData.addAll(data);
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load provinces: $e')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProvinceInheritedWidget(
      provinceData: _provinceData,
      isLoading: _isLoading,
      child: widget.child,
    );
  }
}

class ProvinceView extends StatelessWidget {
  const ProvinceView({super.key});

  @override
  Widget build(BuildContext context) {
    final provinceInheritedWidget = ProvinceInheritedWidget.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Province Page')),
      body: provinceInheritedWidget.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ProvinceCount(),
                Expanded(child: ProvinceList()),
              ],
            ),
    );
  }
}
